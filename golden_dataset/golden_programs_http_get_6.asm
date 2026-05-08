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
;   r8-r7  -- subroutine arguments/temp (caller-saved)
;   r10-r19  -- subroutine local vars (caller-saved)
;   r20-r29  -- preserved across calls if needed (callee-saved by convention)
;   r30 = SP (grows down from 0xFF00)
;   r31 = LR (link register)
;   r0  = CMP result (DO NOT USE as general register!)

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
  LDI r12, 1           ; increment constant

  ; Initialize port to 80 (default)
  LDI r8, 80
  LDI r13, PORT_CELL
  STORE r13, r8

  ; Initialize path to "/" followed by null
  LDI r13, PATH_BUF
  LDI r8, 47         ; '/'
  STORE r13, r8
  LDI r8, 0
  ADD r13, r12         ; r13 = PATH_BUF + 1
  STORE r13, r8      ; path[1] = null

  ; ── Phase 1: Copy host part until ':' or '/' or null ──
  LDI r8, URL_BUF    ; src = URL start
  LDI r13, HOST_BUF   ; dst = host buffer
  LDI r15, 0          ; host_len = 0

url_parse_host_loop:
  ; Load char from URL
  LOAD r3, r8       ; r3 = url[pos]

  ; Check null -- end of URL
  JZ r3, url_parse_done

  ; Check '/' -- start of path
  LDI r7, 47         ; '/'
  CMP r3, r7
  JZ r0, url_parse_path_start

  ; Check ':' -- start of port
  LDI r7, 58         ; ':'
  CMP r3, r7
  JZ r0, url_parse_port

  ; Copy char to host buffer
  STORE r13, r3
  ADD r8, r12          ; src++
  ADD r13, r12          ; dst++
  ADD r15, r12          ; host_len++
  JMP url_parse_host_loop

url_parse_port:
  ; Skip the ':'
  ADD r8, r12

  ; Null-terminate host
  LDI r3, 0
  STORE r13, r3

  ; Parse port number
  LDI r13, 0          ; port = 0

url_parse_port_loop:
  LOAD r3, r8
  JZ r3, url_parse_port_done

  ; Check '/' -- start of path
  LDI r7, 47
  CMP r3, r7
  JNZ r0, url_parse_port_digit

  ; Found '/' after port -- save port first, then copy path
  LDI r7, PORT_CELL
  STORE r7, r13
  JMP url_parse_path_start

url_parse_port_digit:
  ; port = port * 10 + (char - '0')
  LDI r7, 10
  MUL r13, r7        ; port *= 10
  LDI r7, 48         ; '0'
  SUB r3, r7        ; digit = char - '0'
  ADD r13, r3        ; port += digit

  ADD r8, r12
  JMP url_parse_port_loop

url_parse_port_done:
  ; Store port
  LDI r3, PORT_CELL
  STORE r3, r13
  JMP url_parse_done

url_parse_path_start:
  ; Null-terminate host (safe even if already done)
  ; r13 might be host dst ptr or port value -- use r15 (host_len) instead
  LDI r3, HOST_BUF
  ADD r3, r15         ; r3 = HOST_BUF + host_len
  LDI r7, 0
  STORE r3, r7       ; null-terminate host

  ; Copy remaining URL to path buffer
  LDI r13, PATH_BUF   ; dst = path buffer

url_parse_path_loop:
  LOAD r3, r8       ; char from URL
  JZ r3, url_parse_done
  STORE r13, r3      ; copy to path
  ADD r8, r12
  ADD r13, r12
  JMP url_parse_path_loop

url_parse_done:
  POP r31
  RET


; ═══════════════════════════════════════════════
; http_connect -- Connect to the parsed host:port
;
; Input:  HOST_BUF, PORT_CELL
; Output: FD_CELL = connection fd, r0 = 0 on success
; ═══════════════════════════════════════════════
http_connect:
  PUSH r31

  LDI r8, HOST_BUF   ; addr_reg = pointer to host string
  LDI r13, PORT_CELL
  LOAD r13, r13       ; port_reg = port number

  ; We need to load host address and port into registers
  ; CONNECT addr_reg, port_reg, fd_reg
  ; But CONNECT reads from RAM[addr_reg] as IP string
  ; We need a temp register for the fd output
  LDI r15, FD_CELL    ; will store fd here

  ; CONNECT r8, r13, r15  -- but we need to use register numbers
  ; r8=addr, r13=port, r15=fd_out
  CONNECT r8, r13, r15

  ; Store fd to RAM
  LDI r3, FD_CELL
  STORE r3, r15

  POP r31
  RET


; ═══════════════════════════════════════════════
; http_send_get -- Build and send HTTP GET request
;
; Input:  HOST_BUF, PATH_BUF, FD_CELL
; Output: Request sent via TCP, r0 = 0 on success
;
; Builds: "GET /path HTTP/1.0\r\nHost: host\r\n\r\n"
; ═══════════════════════════════════════════════
http_send_get:
  PUSH r31

  ; Build request string in REQ_BUF (0x6400)
  LDI r8, REQ_BUF    ; dst = request buffer
  LDI r12, 1           ; increment

  ; ── "GET " ──
  LDI r13, 71         ; 'G'
  STORE r8, r13
  ADD r8, r12
  LDI r13, 69         ; 'E'
  STORE r8, r13
  ADD r8, r12
  LDI r13, 84         ; 'T'
  STORE r8, r13
  ADD r8, r12
  LDI r13, 32         ; ' '
  STORE r8, r13
  ADD r8, r12

  ; ── Copy path ──
  LDI r13, PATH_BUF
http_send_path_loop:
  LOAD r15, r13       ; char from path
  JZ r15, http_send_path_done
  STORE r8, r15
  ADD r8, r12
  ADD r13, r12
  JMP http_send_path_loop

http_send_path_done:
  ; ── " HTTP/1.0\r\nHost: " ──
  ; ' '
  LDI r13, 32
  STORE r8, r13
  ADD r8, r12
  ; 'H'
  LDI r13, 72
  STORE r8, r13
  ADD r8, r12
  ; 'T'
  LDI r13, 84
  STORE r8, r13
  ADD r8, r12
  ; 'T'
  LDI r13, 84
  STORE r8, r13
  ADD r8, r12
  ; 'P'
  LDI r13, 80
  STORE r8, r13
  ADD r8, r12
  ; '/'
  LDI r13, 47
  STORE r8, r13
  ADD r8, r12
  ; '1'
  LDI r13, 49
  STORE r8, r13
  ADD r8, r12
  ; '.'
  LDI r13, 46
  STORE r8, r13
  ADD r8, r12
  ; '0'
  LDI r13, 48
  STORE r8, r13
  ADD r8, r12
  ; '\r'
  LDI r13, 13
  STORE r8, r13
  ADD r8, r12
  ; '\n'
  LDI r13, 10
  STORE r8, r13
  ADD r8, r12
  ; 'H'
  LDI r13, 72
  STORE r8, r13
  ADD r8, r12
  ; 'o'
  LDI r13, 111
  STORE r8, r13
  ADD r8, r12
  ; 's'
  LDI r13, 115
  STORE r8, r13
  ADD r8, r12
  ; 't'
  LDI r13, 116
  STORE r8, r13
  ADD r8, r12
  ; ':'
  LDI r13, 58
  STORE r8, r13
  ADD r8, r12
  ; ' '
  LDI r13, 32
  STORE r8, r13
  ADD r8, r12

  ; ── Copy host ──
  LDI r13, HOST_BUF
http_send_host_loop:
  LOAD r15, r13
  JZ r15, http_send_host_done
  STORE r8, r15
  ADD r8, r12
  ADD r13, r12
  JMP http_send_host_loop

http_send_host_done:
  ; ── "\r\n\r\n" (end of headers) ──
  LDI r13, 13         ; '\r'
  STORE r8, r13
  ADD r8, r12
  LDI r13, 10         ; '\n'
  STORE r8, r13
  ADD r8, r12
  LDI r13, 13         ; '\r'
  STORE r8, r13
  ADD r8, r12
  LDI r13, 10         ; '\n'
  STORE r8, r13
  ADD r8, r12

  ; Null-terminate request for safety
  LDI r13, 0
  STORE r8, r13

  ; ── Calculate request length ──
  LDI r13, REQ_BUF
  SUB r8, r13        ; r8 = request length (dst - base)

  ; ── Send via TCP ──
  LDI r13, FD_CELL
  LOAD r13, r13       ; r13 = fd
  LDI r15, REQ_BUF    ; r15 = buf addr
  ; r8 = length
  ; SOCKSEND fd_reg, buf_reg, len_reg, sent_reg
  SOCKSEND r13, r15, r8, r3

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

  LDI r8, 0          ; total_received = 0
  LDI r12, 1           ; increment

  ; Store initial body_len = 0
  LDI r13, BODY_LEN
  STORE r13, r8

http_recv_loop:
  ; Check if buffer is full
  LDI r13, RESP_MAX
  CMP r8, r13
  BGE r0, http_recv_done

  ; Calculate remaining buffer space
  LDI r13, RESP_MAX
  SUB r13, r8        ; remaining = RESP_MAX - total

  ; SOCKRECV fd, buf_addr, remaining, received
  LDI r15, FD_CELL
  LOAD r15, r15       ; r15 = fd

  ; Calculate write address: RESP_BUF + total_received
  LDI r3, RESP_BUF
  ADD r3, r8        ; r3 = buf addr

  ; r13 = remaining (max_len)
  SOCKRECV r15, r3, r13, r7

  ; Check result
  ; r0 = status: 0=OK, 6=would_block, 7=closed
  JZ r0, http_recv_got_data

  ; Connection closed -- done
  LDI r13, 7          ; NET_ERR_CONNECTION_CLOSED
  CMP r0, r13
  JZ r0, http_recv_done

  ; Would block -- yield a frame and retry
  FRAME
  JMP http_recv_loop

http_recv_got_data:
  ; r7 = bytes received
  ADD r8, r7        ; total += received

  ; Update body_len
  LDI r13, BODY_LEN
  STORE r13, r8

  ; Check if received 0 bytes (shouldn't happen, but safety)
  JZ r7, http_recv_done

  ; Continue reading
  JMP http_recv_loop

http_recv_done:
  ; Null-terminate response buffer at total_received position
  LDI r13, RESP_BUF
  ADD r13, r8
  LDI r15, 0
  STORE r13, r15

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
  LDI r8, RESP_BUF
  LDI r12, 1
  LDI r13, 9
  ADD r8, r13        ; r8 points to status code digits

  ; Parse 3-digit status: code = d1*100 + d2*10 + d3
  LOAD r15, r8       ; first digit
  LDI r13, 48
  SUB r15, r13        ; d1 = char - '0'
  LDI r13, 100
  MUL r15, r13        ; d1 * 100
  LDI r3, STATUS_CELL
  STORE r3, r15      ; partial status

  ADD r8, r12
  LOAD r15, r8       ; second digit
  LDI r13, 48
  SUB r15, r13        ; d2 = char - '0'
  LDI r13, 10
  MUL r15, r13        ; d2 * 10
  LDI r3, STATUS_CELL
  LOAD r3, r3
  ADD r3, r15
  LDI r15, STATUS_CELL
  STORE r15, r3      ; status += d2*10

  ADD r8, r12
  LOAD r15, r8       ; third digit
  LDI r13, 48
  SUB r15, r13        ; d3 = char - '0'
  LDI r3, STATUS_CELL
  LOAD r3, r3
  ADD r3, r15
  LDI r15, STATUS_CELL
  STORE r15, r3      ; status += d3

  ; ── Find \r\n\r\n delimiter ──
  LDI r8, RESP_BUF   ; scan position
  LDI r13, BODY_LEN
  LOAD r13, r13       ; response length
  LDI r15, 0          ; bytes scanned

http_strip_scan:
  ; Check if we've scanned enough (need at least 4 more bytes for \r\n\r\n)
  CMP r15, r13
  BGE r0, http_strip_no_body

  ; Check for \r\n\r\n pattern
  LOAD r3, r8       ; char[pos]
  LDI r7, 13         ; '\r'
  CMP r3, r7
  JNZ r0, http_strip_next

  ; Found \r, check \n\r\n
  MOV r10, r8
  ADD r10, r12
  LOAD r3, r10       ; char[pos+1]
  LDI r7, 10         ; '\n'
  CMP r3, r7
  JNZ r0, http_strip_next

  ADD r10, r12
  LOAD r3, r10       ; char[pos+2]
  LDI r7, 13         ; '\r'
  CMP r3, r7
  JNZ r0, http_strip_next

  ADD r10, r12
  LOAD r3, r10       ; char[pos+3]
  LDI r7, 10         ; '\n'
  CMP r3, r7
  JNZ r0, http_strip_next

  ; Found \r\n\r\n at pos! Body starts at pos+4
  ADD r8, r12
  ADD r8, r12
  ADD r8, r12
  ADD r8, r12          ; r8 = body start

  ; Copy body to BODY_BUF
  LDI r3, BODY_BUF   ; dst
  LDI r10, 0          ; body count

http_strip_copy:
  LOAD r7, r8       ; char from body
  JZ r7, http_strip_copy_done
  STORE r3, r7      ; copy to body buffer
  ADD r8, r12
  ADD r3, r12
  ADD r10, r12
  JMP http_strip_copy

http_strip_copy_done:
  ; Null-terminate body
  LDI r7, 0
  STORE r3, r7

  ; Update BODY_LEN to actual body length
  LDI r8, BODY_LEN
  STORE r8, r10

  POP r31
  RET

http_strip_next:
  ADD r8, r12
  ADD r15, r12
  JMP http_strip_scan

http_strip_no_body:
  ; No body found -- set body_len = 0, null-terminate body buf
  LDI r8, BODY_BUF
  LDI r13, 0
  STORE r8, r13
  LDI r8, BODY_LEN
  STORE r8, r13

  POP r31
  RET


; ═══════════════════════════════════════════════
; http_close -- Disconnect and clean up
; ═══════════════════════════════════════════════
http_close:
  PUSH r31
  LDI r8, FD_CELL
  LOAD r8, r8
  DISCONNECT r8
  POP r31
  RET


; ═══════════════════════════════════════════════
; http_get -- Full HTTP GET in one call
;
; Input:  URL string at URL_BUF (0x6000)
; Output: BODY_BUF (0x9000), BODY_LEN, STATUS_CELL
;         r0 = 0 on success
;
; This is the main entry point combining all steps.
; ═══════════════════════════════════════════════
http_get:
  PUSH r31

  ; Step 1: Parse URL
  CALL url_parse

  ; Step 2: Connect
  CALL http_connect

  ; Check connection result (r0 should be NET_OK = 0)
  JNZ r0, http_get_fail

  ; Step 3: Send GET request
  CALL http_send_get

  ; Check send result
  JNZ r0, http_get_close_fail

  ; Step 4: Receive response
  CALL http_recv_response

  ; Step 5: Strip headers, extract body
  CALL http_strip_headers

  ; Step 6: Close connection
  CALL http_close

  ; Success
  LDI r0, 0
  POP r31
  RET

http_get_close_fail:
  CALL http_close

http_get_fail:
  ; r0 already has error code
  POP r31
  RET
