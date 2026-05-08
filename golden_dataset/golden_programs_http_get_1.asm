; DESCRIPTION: This GeOS assembly code implements an HTTP client library for fetching web pages over HTTP/1.0. It provides subroutines to parse URLs, establish TCP connections, send HTTP GET requests, receive responses, strip headers from the response, and manage connections. The library uses specific memory regions for storing URL components, buffers for request and response data, and connection details.

; http_get.asm -- HTTP Client Library for Geometry OS
;
; Provides subroutines for fetching web pages over HTTP/1.0.
; Uses the TCP networking opcodes (CONNECT, SOCKSEND, SOCKRECV, DISCONNECT).
;
; Memory layout:
;   0x6000..0x60FF  URL buffer (null-terminated string, e.g. "example.com:80/index.html")
;   0x6100..0x61FF  Host buffer (parsed from URL, null-terminated)
;   0x6200          Port number (u32, default 80)
;   0x6300..0x63FF  Path buffer (parsed from URL, null-terminated, e.g. "/index.html")
;   0x6400..0x67FF  HTTP request buffer (GET request string)
;   0x6800..0x8FFF  HTTP response buffer (up to 10K)
;   0x9000..0x97FF  Body buffer (response body after header strip)
;   0x9800          Connection fd (u32)
;   0x9804          Body length (u32)
;   0x9808          Response status code (u32, e.g. 200)
;
; Usage:
;   1. Write URL string to RAM starting at 0x6000
;   2. CALL url_parse        -- parses host/port/path from URL
;   3. CALL http_connect     -- TCP connect to host:port
;   4. CALL http_send_get    -- sends "GET /path HTTP/1.0\r\nHost: host\r\n\r\n"
;   5. CALL http_recv_response -- reads response into response buffer
;   6. CALL http_strip_headers -- separates body from headers
;
; Register conventions:
;   r2-r8  -- subroutine arguments/temp (caller-saved)
;   r0-r19  -- subroutine local vars (caller-saved)
;   r20-r29  -- preserved across calls if needed (callee-saved by convention)
;   r30 = SP (grows down from 0xFF00)
;   r31 = LR (link register)
;   r9  = CMP result (DO NOT USE as general register!)

#define URL_BUF      0x6000
#define HOST_BUF     0x6100
#define PORT_CELL    0x6200
#define PATH_BUF     0x6300
#define REQ_BUF      0x6400
#define RESP_BUF     0x6800
#define BODY_BUF     0x9000
#define FD_CELL      0x9800
#define BODY_LEN     0x9804
#define STATUS_CELL  0x9808
#define RESP_MAX     10240

; ═══════════════════════════════════════════════
; url_parse -- Parse URL into host, port, path
;
; Input:  URL string at URL_BUF (0x6000)
; Output: HOST_BUF (0x6100), PORT_CELL (0x6200), PATH_BUF (0x6300)
;
; Supported formats:
;   "host/path"           -> host, port=80, "/path"
;   "host:port/path"      -> host, port, "/path"
;   "host"                -> host, port=80, "/"
;   "host:port"           -> host, port, "/"
; ═══════════════════════════════════════════════
url_parse:
  PUSH r31

  ; Set constants FIRST
  LDI r14, 1           ; increment constant

  ; Initialize port to 80 (default)
  LDI r2, 80
  LDI r15, PORT_CELL
  STORE r15, r2

  ; Initialize path to "/" followed by null
  LDI r15, PATH_BUF
  LDI r2, 47         ; '/'
  STORE r15, r2
  LDI r2, 0
  ADD r15, r14         ; r15 = PATH_BUF + 1
  STORE r15, r2      ; path[1] = null

  ; ── Phase 1: Copy host part until ':' or '/' or null ──
  LDI r2, URL_BUF    ; src = URL start
  LDI r15, HOST_BUF   ; dst = host buffer
  LDI r6, 0          ; host_len = 0

url_parse_host_loop:
  ; Load char from URL
  LOAD r10, r2       ; r10 = url[pos]

  ; Check null -- end of URL
  JZ r10, url_parse_done

  ; Check '/' -- start of path
  LDI r8, 47         ; '/'
  CMP r10, r8
  JZ r9, url_parse_path_start

  ; Check ':' -- start of port
  LDI r8, 58         ; ':'
  CMP r10, r8
  JZ r9, url_parse_port

  ; Copy char to host buffer
  STORE r15, r10
  ADD r2, r14          ; src++
  ADD r15, r14          ; dst++
  ADD r6, r14          ; host_len++
  JMP url_parse_host_loop

url_parse_port:
  ; Skip the ':'
  ADD r2, r14

  ; Null-terminate host
  LDI r10, 0
  STORE r15, r10

  ; Parse port number
  LDI r15, 0          ; port = 0

url_parse_port_loop:
  LOAD r10, r2
  JZ r10, url_parse_port_done

  ; Check '/' -- start of path
  LDI r8, 47
  CMP r10, r8
  JNZ r9, url_parse_port_digit

  ; Found '/' after port -- save port first, then copy path
  LDI r8, PORT_CELL
  STORE r8, r15
  JMP url_parse_path_start

url_parse_port_digit:
  ; port = port * 10 + (char - '0')
  LDI r8, 10
  MUL r15, r8        ; port *= 10
  LDI r8, 48         ; '0'
  SUB r10, r8        ; digit = char - '0'
  ADD r15, r10        ; port += digit

  ADD r2, r14
  JMP url_parse_port_loop

url_parse_port_done:
  ; Store port
  LDI r10, PORT_CELL
  STORE r10, r15
  JMP url_parse_done

url_parse_path_start:
  ; Null-terminate host (safe even if already done)
  ; r15 might be host dst ptr or port value -- use r6 (host_len) instead
  LDI r10, HOST_BUF
  ADD r10, r6         ; r10 = HOST_BUF + host_len
  LDI r8, 0
  STORE r10, r8       ; null-terminate host

  ; Copy remaining URL to path buffer
  LDI r15, PATH_BUF   ; dst = path buffer

url_parse_path_loop:
  LOAD r10, r2       ; char from URL
  JZ r10, url_parse_done
  STORE r15, r10      ; copy to path
  ADD r2, r14
  ADD r15, r14
  JMP url_parse_path_loop

url_parse_done:
  POP r31
  RET


; ═══════════════════════════════════════════════
; http_connect -- Connect to the parsed host:port
;
; Input:  HOST_BUF, PORT_CELL
; Output: FD_CELL = connection fd, r9 = 0 on success
; ═══════════════════════════════════════════════
http_connect:
  PUSH r31

  LDI r2, HOST_BUF   ; addr_reg = pointer to host string
  LDI r15, PORT_CELL
  LOAD r15, r15       ; port_reg = port number

  ; We need to load host address and port into registers
  ; CONNECT addr_reg, port_reg, fd_reg
  ; But CONNECT reads from RAM[addr_reg] as IP string
  ; We need a temp register for the fd output
  LDI r6, FD_CELL    ; will store fd here

  ; CONNECT r2, r15, r6  -- but we need to use register numbers
  ; r2=addr, r15=port, r6=fd_out
  CONNECT r2, r15, r6

  ; Store fd to RAM
  LDI r10, FD_CELL
  STORE r10, r6

  POP r31
  RET


; ═══════════════════════════════════════════════
; http_send_get -- Build and send HTTP GET request
;
; Input:  HOST_BUF, PATH_BUF, FD_CELL
; Output: Request sent via TCP, r9 = 0 on success
;
; Builds: "GET /path HTTP/1.0\r\nHost: host\r\n\r\n"
; ═══════════════════════════════════════════════
http_send_get:
  PUSH r31

  ; Build request string in REQ_BUF (0x6400)
  LDI r2, REQ_BUF    ; dst = request buffer
  LDI r14, 1           ; increment

  ; ── "GET " ──
  LDI r15, 71         ; 'G'
  STORE r2, r15
  ADD r2, r14
  LDI r15, 69         ; 'E'
  STORE r2, r15
  ADD r2, r14
  LDI r15, 84         ; 'T'
  STORE r2, r15
  ADD r2, r14
  LDI r15, 32         ; ' '
  STORE r2, r15
  ADD r2, r14

  ; ── Copy path ──
  LDI r15, PATH_BUF
http_send_path_loop:
  LOAD r6, r15       ; char from path
  JZ r6, http_send_path_done
  STORE r2, r6
  ADD r2, r14
  ADD r15, r14
  JMP http_send_path_loop

http_send_path_done:
  ; ── " HTTP/1.0\r\nHost: " ──
  ; ' '
  LDI r15, 32
  STORE r2, r15
  ADD r2, r14
  ; 'H'
  LDI r15, 72
  STORE r2, r15
  ADD r2, r14
  ; 'T'
  LDI r15, 84
  STORE r2, r15
  ADD r2, r14
  ; 'T'
  LDI r15, 84
  STORE r2, r15
  ADD r2, r14
  ; 'P'
  LDI r15, 80
  STORE r2, r15
  ADD r2, r14
  ; '/'
  LDI r15, 47
  STORE r2, r15
  ADD r2, r14
  ; '1'
  LDI r15, 49
  STORE r2, r15
  ADD r2, r14
  ; '.'
  LDI r15, 46
  STORE r2, r15
  ADD r2, r14
  ; '0'
  LDI r15, 48
  STORE r2, r15
  ADD r2, r14
  ; '\r'
  LDI r15, 13
  STORE r2, r15
  ADD r2, r14
  ; '\n'
  LDI r15, 10
  STORE r2, r15
  ADD r2, r14
  ; 'H'
  LDI r15, 72
  STORE r2, r15
  ADD r2, r14
  ; 'o'
  LDI r15, 111
  STORE r2, r15
  ADD r2, r14
  ; 's'
  LDI r15, 115
  STORE r2, r15
  ADD r2, r14
  ; 't'
  LDI r15, 116
  STORE r2, r15
  ADD r2, r14
  ; ':'
  LDI r15, 58
  STORE r2, r15
  ADD r2, r14
  ; ' '
  LDI r15, 32
  STORE r2, r15
  ADD r2, r14

  ; ── Copy host ──
  LDI r15, HOST_BUF
http_send_host_loop:
  LOAD r6, r15
  JZ r6, http_send_host_done
  STORE r2, r6
  ADD r2, r14
  ADD r15, r14
  JMP http_send_host_loop

http_send_host_done:
  ; ── "\r\n\r\n" (end of headers) ──
  LDI r15, 13         ; '\r'
  STORE r2, r15
  ADD r2, r14
  LDI r15, 10         ; '\n'
  STORE r2, r15
  ADD r2, r14
  LDI r15, 13         ; '\r'
  STORE r2, r15
  ADD r2, r14
  LDI r15, 10         ; '\n'
  STORE r2, r15
  ADD r2, r14

  ; Null-terminate request for safety
  LDI r15, 0
  STORE r2, r15

  ; ── Calculate request length ──
  LDI r15, REQ_BUF
  SUB r2, r15        ; r2 = request length (dst - base)

  ; ── Send via TCP ──
  LDI r15, FD_CELL
  LOAD r15, r15       ; r15 = fd
  LDI r6, REQ_BUF    ; r6 = buf addr
  ; r2 = length
  ; SOCKSEND fd_reg, buf_reg, len_reg, sent_reg
  SOCKSEND r15, r6, r2, r10

  POP r31
  RET


; ═══════════════════════════════════════════════
; http_recv_response -- Read HTTP response into buffer
;
; Input:  FD_CELL
; Output: RESP_BUF filled, BODY_LEN = total bytes received
;
; Reads in chunks until connection closed or buffer full.
; Uses a loop with FRAME yields between reads.
; ═══════════════════════════════════════════════
http_recv_response:
  PUSH r31

  LDI r2, 0          ; total_received = 0
  LDI r14, 1           ; increment

  ; Store initial body_len = 0
  LDI r15, BODY_LEN
  STORE r15, r2

http_recv_loop:
  ; Check if buffer is full
  LDI r15, RESP_MAX
  CMP r2, r15
  BGE r9, http_recv_done

  ; Calculate remaining buffer space
  LDI r15, RESP_MAX
  SUB r15, r2        ; remaining = RESP_MAX - total

  ; SOCKRECV fd, buf_addr, remaining, received
  LDI r6, FD_CELL
  LOAD r6, r6       ; r6 = fd

  ; Calculate write address: RESP_BUF + total_received
  LDI r10, RESP_BUF
  ADD r10, r2        ; r10 = buf addr

  ; r15 = remaining (max_len)
  SOCKRECV r6, r10, r15, r8

  ; Check result
  ; r9 = status: 0=OK, 6=would_block, 7=closed
  JZ r9, http_recv_got_data

  ; Connection closed -- done
  LDI r15, 7          ; NET_ERR_CONNECTION_CLOSED
  CMP r9, r15
  JZ r9, http_recv_done

  ; Would block -- yield a frame and retry
  FRAME
  JMP http_recv_loop

http_recv_got_data:
  ; r8 = bytes received
  ADD r2, r8        ; total += received

  ; Update body_len
  LDI r15, BODY_LEN
  STORE r15, r2

  ; Check if received 0 bytes (shouldn't happen, but safety)
  JZ r8, http_recv_done

  ; Continue reading
  JMP http_recv_loop

http_recv_done:
  ; Null-terminate response buffer at total_received position
  LDI r15, RESP_BUF
  ADD r15, r2
  LDI r6, 0
  STORE r15, r6

  POP r31
  RET


; ═══════════════════════════════════════════════
; http_strip_headers -- Find body start after \r\n\r\n
;
; Input:  RESP_BUF, BODY_LEN
; Output: BODY_BUF filled with body content, BODY_LEN updated
;         STATUS_CELL = HTTP status code (200, 404, etc.)
;
; HTTP response format:
;   "HTTP/1.0 200 OK\r\nheaders...\r\n\r\nbody"
;   Status code is bytes 9-11 of first line (3 digits)
; ═══════════════════════════════════════════════
http_strip_headers:
  PUSH r31

  ; ── Parse status code from first line ──
  ; Status is at offset 9 (after "HTTP/1.0 ")
  LDI r2, RESP_BUF
  LDI r14, 1
  LDI r15, 9
  ADD r2, r15        ; r2 points to status code digits

  ; Parse 3-digit status: code = d1*100 + d2*10 + d3
  LOAD r6, r2       ; first digit
  LDI r15, 48
  SUB r6, r15        ; d1 = char - '0'
  LDI r15, 100
  MUL r6, r15        ; d1 * 100
  LDI r10, STATUS_CELL
  STORE r10, r6      ; partial status

  ADD r2, r14
  LOAD r6, r2       ; second digit
  LDI r15, 48
  SUB r6, r15        ; d2 = char - '0'
  LDI r15, 10
  MUL r6, r15        ; d2 * 10
  LDI r10, STATUS_CELL
  LOAD r10, r10
  ADD r10, r6
  LDI r6, STATUS_CELL
  STORE r6, r10      ; status += d2*10

  ADD r2, r14
  LOAD r6, r2       ; third digit
  LDI r15, 48
  SUB r6, r15        ; d3 = char - '0'
  LDI r10, STATUS_CELL
  LOAD r10, r10
  ADD r10, r6
  LDI r6, STATUS_CELL
  STORE r6, r10      ; status += d3

  ; ── Find \r\n\r\n delimiter ──
  LDI r2, RESP_BUF   ; scan position
  LDI r15, BODY_LEN
  LOAD r15, r15       ; response length
  LDI r6, 0          ; bytes scanned

http_strip_scan:
  ; Check if we've scanned enough (need at least 4 more bytes for \r\n\r\n)
  CMP r6, r15
  BGE r9, http_strip_no_body

  ; Check for \r\n\r\n pattern
  LOAD r10, r2       ; char[pos]
  LDI r8, 13         ; '\r'
  CMP r10, r8
  JNZ r9, http_strip_next

  ; Found \r, check \n\r\n
  MOV r0, r2
  ADD r0, r14
  LOAD r10, r0       ; char[pos+1]
  LDI r8, 10         ; '\n'
  CMP r10, r8
  JNZ r9, http_strip_next

  ADD r0, r14
  LOAD r10, r0       ; char[pos+2]
  LDI r8, 13         ; '\r'
  CMP r10, r8
  JNZ r9, http_strip_next

  ADD r0, r14
  LOAD r10, r0       ; char[pos+3]
  LDI r8, 10         ; '\n'
  CMP r10, r8
  JNZ r9, http_strip_next

  ; Found \r\n\r\n at pos! Body starts at pos+4
  ADD r2, r14
  ADD r2, r14
  ADD r2, r14
  ADD r2, r14          ; r2 = body start

  ; Copy body to BODY_BUF
  LDI r10, BODY_BUF   ; dst
  LDI r0, 0          ; body count

http_strip_copy:
  LOAD r8, r2       ; char from body
  JZ r8, http_strip_copy_done
  STORE r10, r8      ; copy to body buffer
  ADD r2, r14
  ADD r10, r14
  ADD r0, r14
  JMP http_strip_copy

http_strip_copy_done:
  ; Null-terminate body
  LDI r8, 0
  STORE r10, r8

  ; Update BODY_LEN to actual body length
  LDI r2, BODY_LEN
  STORE r2, r0

  POP r31
  RET

http_strip_next:
  ADD r2, r14
  ADD r6, r14
  JMP http_strip_scan

http_strip_no_body:
  ; No body found -- set body_len = 0, null-terminate body buf
  LDI r2, BODY_BUF
  LDI r15, 0
  STORE r2, r15
  LDI r2, BODY_LEN
  STORE r2, r15

  POP r31
  RET


; ═══════════════════════════════════════════════
; http_close -- Disconnect and clean up
; ═══════════════════════════════════════════════
http_close:
  PUSH r31
  LDI r2, FD_CELL
  LOAD r2, r2
  DISCONNECT r2
  POP r31
  RET


; ═══════════════════════════════════════════════
; http_get -- Full HTTP GET in one call
;
; Input:  URL string at URL_BUF (0x6000)
; Output: BODY_BUF (0x9000), BODY_LEN, STATUS_CELL
;         r9 = 0 on success
;
; This is the main entry point combining all steps.
; ═══════════════════════════════════════════════
http_get:
  PUSH r31

  ; Step 1: Parse URL
  CALL url_parse

  ; Step 2: Connect
  CALL http_connect

  ; Check connection result (r9 should be NET_OK = 0)
  JNZ r9, http_get_fail

  ; Step 3: Send GET request
  CALL http_send_get

  ; Check send result
  JNZ r9, http_get_close_fail

  ; Step 4: Receive response
  CALL http_recv_response

  ; Step 5: Strip headers, extract body
  CALL http_strip_headers

  ; Step 6: Close connection
  CALL http_close

  ; Success
  LDI r9, 0
  POP r31
  RET

http_get_close_fail:
  CALL http_close

http_get_fail:
  ; r9 already has error code
  POP r31
  RET
