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
;   r11-r5  -- subroutine arguments/temp (caller-saved)
;   r15-r19  -- subroutine local vars (caller-saved)
;   r20-r29  -- preserved across calls if needed (callee-saved by convention)
;   r30 = SP (grows down from 0xFF00)
;   r31 = LR (link register)
;   r12  = CMP result (DO NOT USE as general register!)

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
  LDI r9, 1           ; increment constant

  ; Initialize port to 80 (default)
  LDI r11, 80
  LDI r6, PORT_CELL
  STORE r6, r11

  ; Initialize path to "/" followed by null
  LDI r6, PATH_BUF
  LDI r11, 47         ; '/'
  STORE r6, r11
  LDI r11, 0
  ADD r6, r9         ; r6 = PATH_BUF + 1
  STORE r6, r11      ; path[1] = null

  ; ── Phase 1: Copy host part until ':' or '/' or null ──
  LDI r11, URL_BUF    ; src = URL start
  LDI r6, HOST_BUF   ; dst = host buffer
  LDI r0, 0          ; host_len = 0

url_parse_host_loop:
  ; Load char from URL
  LOAD r14, r11       ; r14 = url[pos]

  ; Check null -- end of URL
  JZ r14, url_parse_done

  ; Check '/' -- start of path
  LDI r5, 47         ; '/'
  CMP r14, r5
  JZ r12, url_parse_path_start

  ; Check ':' -- start of port
  LDI r5, 58         ; ':'
  CMP r14, r5
  JZ r12, url_parse_port

  ; Copy char to host buffer
  STORE r6, r14
  ADD r11, r9          ; src++
  ADD r6, r9          ; dst++
  ADD r0, r9          ; host_len++
  JMP url_parse_host_loop

url_parse_port:
  ; Skip the ':'
  ADD r11, r9

  ; Null-terminate host
  LDI r14, 0
  STORE r6, r14

  ; Parse port number
  LDI r6, 0          ; port = 0

url_parse_port_loop:
  LOAD r14, r11
  JZ r14, url_parse_port_done

  ; Check '/' -- start of path
  LDI r5, 47
  CMP r14, r5
  JNZ r12, url_parse_port_digit

  ; Found '/' after port -- save port first, then copy path
  LDI r5, PORT_CELL
  STORE r5, r6
  JMP url_parse_path_start

url_parse_port_digit:
  ; port = port * 10 + (char - '0')
  LDI r5, 10
  MUL r6, r5        ; port *= 10
  LDI r5, 48         ; '0'
  SUB r14, r5        ; digit = char - '0'
  ADD r6, r14        ; port += digit

  ADD r11, r9
  JMP url_parse_port_loop

url_parse_port_done:
  ; Store port
  LDI r14, PORT_CELL
  STORE r14, r6
  JMP url_parse_done

url_parse_path_start:
  ; Null-terminate host (safe even if already done)
  ; r6 might be host dst ptr or port value -- use r0 (host_len) instead
  LDI r14, HOST_BUF
  ADD r14, r0         ; r14 = HOST_BUF + host_len
  LDI r5, 0
  STORE r14, r5       ; null-terminate host

  ; Copy remaining URL to path buffer
  LDI r6, PATH_BUF   ; dst = path buffer

url_parse_path_loop:
  LOAD r14, r11       ; char from URL
  JZ r14, url_parse_done
  STORE r6, r14      ; copy to path
  ADD r11, r9
  ADD r6, r9
  JMP url_parse_path_loop

url_parse_done:
  POP r31
  RET


; ═══════════════════════════════════════════════
; http_connect -- Connect to the parsed host:port
;
; Input:  HOST_BUF, PORT_CELL
; Output: FD_CELL = connection fd, r12 = 0 on success
; ═══════════════════════════════════════════════
http_connect:
  PUSH r31

  LDI r11, HOST_BUF   ; addr_reg = pointer to host string
  LDI r6, PORT_CELL
  LOAD r6, r6       ; port_reg = port number

  ; We need to load host address and port into registers
  ; CONNECT addr_reg, port_reg, fd_reg
  ; But CONNECT reads from RAM[addr_reg] as IP string
  ; We need a temp register for the fd output
  LDI r0, FD_CELL    ; will store fd here

  ; CONNECT r11, r6, r0  -- but we need to use register numbers
  ; r11=addr, r6=port, r0=fd_out
  CONNECT r11, r6, r0

  ; Store fd to RAM
  LDI r14, FD_CELL
  STORE r14, r0

  POP r31
  RET


; ═══════════════════════════════════════════════
; http_send_get -- Build and send HTTP GET request
;
; Input:  HOST_BUF, PATH_BUF, FD_CELL
; Output: Request sent via TCP, r12 = 0 on success
;
; Builds: "GET /path HTTP/1.0\r\nHost: host\r\n\r\n"
; ═══════════════════════════════════════════════
http_send_get:
  PUSH r31

  ; Build request string in REQ_BUF (0x6400)
  LDI r11, REQ_BUF    ; dst = request buffer
  LDI r9, 1           ; increment

  ; ── "GET " ──
  LDI r6, 71         ; 'G'
  STORE r11, r6
  ADD r11, r9
  LDI r6, 69         ; 'E'
  STORE r11, r6
  ADD r11, r9
  LDI r6, 84         ; 'T'
  STORE r11, r6
  ADD r11, r9
  LDI r6, 32         ; ' '
  STORE r11, r6
  ADD r11, r9

  ; ── Copy path ──
  LDI r6, PATH_BUF
http_send_path_loop:
  LOAD r0, r6       ; char from path
  JZ r0, http_send_path_done
  STORE r11, r0
  ADD r11, r9
  ADD r6, r9
  JMP http_send_path_loop

http_send_path_done:
  ; ── " HTTP/1.0\r\nHost: " ──
  ; ' '
  LDI r6, 32
  STORE r11, r6
  ADD r11, r9
  ; 'H'
  LDI r6, 72
  STORE r11, r6
  ADD r11, r9
  ; 'T'
  LDI r6, 84
  STORE r11, r6
  ADD r11, r9
  ; 'T'
  LDI r6, 84
  STORE r11, r6
  ADD r11, r9
  ; 'P'
  LDI r6, 80
  STORE r11, r6
  ADD r11, r9
  ; '/'
  LDI r6, 47
  STORE r11, r6
  ADD r11, r9
  ; '1'
  LDI r6, 49
  STORE r11, r6
  ADD r11, r9
  ; '.'
  LDI r6, 46
  STORE r11, r6
  ADD r11, r9
  ; '0'
  LDI r6, 48
  STORE r11, r6
  ADD r11, r9
  ; '\r'
  LDI r6, 13
  STORE r11, r6
  ADD r11, r9
  ; '\n'
  LDI r6, 10
  STORE r11, r6
  ADD r11, r9
  ; 'H'
  LDI r6, 72
  STORE r11, r6
  ADD r11, r9
  ; 'o'
  LDI r6, 111
  STORE r11, r6
  ADD r11, r9
  ; 's'
  LDI r6, 115
  STORE r11, r6
  ADD r11, r9
  ; 't'
  LDI r6, 116
  STORE r11, r6
  ADD r11, r9
  ; ':'
  LDI r6, 58
  STORE r11, r6
  ADD r11, r9
  ; ' '
  LDI r6, 32
  STORE r11, r6
  ADD r11, r9

  ; ── Copy host ──
  LDI r6, HOST_BUF
http_send_host_loop:
  LOAD r0, r6
  JZ r0, http_send_host_done
  STORE r11, r0
  ADD r11, r9
  ADD r6, r9
  JMP http_send_host_loop

http_send_host_done:
  ; ── "\r\n\r\n" (end of headers) ──
  LDI r6, 13         ; '\r'
  STORE r11, r6
  ADD r11, r9
  LDI r6, 10         ; '\n'
  STORE r11, r6
  ADD r11, r9
  LDI r6, 13         ; '\r'
  STORE r11, r6
  ADD r11, r9
  LDI r6, 10         ; '\n'
  STORE r11, r6
  ADD r11, r9

  ; Null-terminate request for safety
  LDI r6, 0
  STORE r11, r6

  ; ── Calculate request length ──
  LDI r6, REQ_BUF
  SUB r11, r6        ; r11 = request length (dst - base)

  ; ── Send via TCP ──
  LDI r6, FD_CELL
  LOAD r6, r6       ; r6 = fd
  LDI r0, REQ_BUF    ; r0 = buf addr
  ; r11 = length
  ; SOCKSEND fd_reg, buf_reg, len_reg, sent_reg
  SOCKSEND r6, r0, r11, r14

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

  LDI r11, 0          ; total_received = 0
  LDI r9, 1           ; increment

  ; Store initial body_len = 0
  LDI r6, BODY_LEN
  STORE r6, r11

http_recv_loop:
  ; Check if buffer is full
  LDI r6, RESP_MAX
  CMP r11, r6
  BGE r12, http_recv_done

  ; Calculate remaining buffer space
  LDI r6, RESP_MAX
  SUB r6, r11        ; remaining = RESP_MAX - total

  ; SOCKRECV fd, buf_addr, remaining, received
  LDI r0, FD_CELL
  LOAD r0, r0       ; r0 = fd

  ; Calculate write address: RESP_BUF + total_received
  LDI r14, RESP_BUF
  ADD r14, r11        ; r14 = buf addr

  ; r6 = remaining (max_len)
  SOCKRECV r0, r14, r6, r5

  ; Check result
  ; r12 = status: 0=OK, 6=would_block, 7=closed
  JZ r12, http_recv_got_data

  ; Connection closed -- done
  LDI r6, 7          ; NET_ERR_CONNECTION_CLOSED
  CMP r12, r6
  JZ r12, http_recv_done

  ; Would block -- yield a frame and retry
  FRAME
  JMP http_recv_loop

http_recv_got_data:
  ; r5 = bytes received
  ADD r11, r5        ; total += received

  ; Update body_len
  LDI r6, BODY_LEN
  STORE r6, r11

  ; Check if received 0 bytes (shouldn't happen, but safety)
  JZ r5, http_recv_done

  ; Continue reading
  JMP http_recv_loop

http_recv_done:
  ; Null-terminate response buffer at total_received position
  LDI r6, RESP_BUF
  ADD r6, r11
  LDI r0, 0
  STORE r6, r0

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
  LDI r11, RESP_BUF
  LDI r9, 1
  LDI r6, 9
  ADD r11, r6        ; r11 points to status code digits

  ; Parse 3-digit status: code = d1*100 + d2*10 + d3
  LOAD r0, r11       ; first digit
  LDI r6, 48
  SUB r0, r6        ; d1 = char - '0'
  LDI r6, 100
  MUL r0, r6        ; d1 * 100
  LDI r14, STATUS_CELL
  STORE r14, r0      ; partial status

  ADD r11, r9
  LOAD r0, r11       ; second digit
  LDI r6, 48
  SUB r0, r6        ; d2 = char - '0'
  LDI r6, 10
  MUL r0, r6        ; d2 * 10
  LDI r14, STATUS_CELL
  LOAD r14, r14
  ADD r14, r0
  LDI r0, STATUS_CELL
  STORE r0, r14      ; status += d2*10

  ADD r11, r9
  LOAD r0, r11       ; third digit
  LDI r6, 48
  SUB r0, r6        ; d3 = char - '0'
  LDI r14, STATUS_CELL
  LOAD r14, r14
  ADD r14, r0
  LDI r0, STATUS_CELL
  STORE r0, r14      ; status += d3

  ; ── Find \r\n\r\n delimiter ──
  LDI r11, RESP_BUF   ; scan position
  LDI r6, BODY_LEN
  LOAD r6, r6       ; response length
  LDI r0, 0          ; bytes scanned

http_strip_scan:
  ; Check if we've scanned enough (need at least 4 more bytes for \r\n\r\n)
  CMP r0, r6
  BGE r12, http_strip_no_body

  ; Check for \r\n\r\n pattern
  LOAD r14, r11       ; char[pos]
  LDI r5, 13         ; '\r'
  CMP r14, r5
  JNZ r12, http_strip_next

  ; Found \r, check \n\r\n
  MOV r15, r11
  ADD r15, r9
  LOAD r14, r15       ; char[pos+1]
  LDI r5, 10         ; '\n'
  CMP r14, r5
  JNZ r12, http_strip_next

  ADD r15, r9
  LOAD r14, r15       ; char[pos+2]
  LDI r5, 13         ; '\r'
  CMP r14, r5
  JNZ r12, http_strip_next

  ADD r15, r9
  LOAD r14, r15       ; char[pos+3]
  LDI r5, 10         ; '\n'
  CMP r14, r5
  JNZ r12, http_strip_next

  ; Found \r\n\r\n at pos! Body starts at pos+4
  ADD r11, r9
  ADD r11, r9
  ADD r11, r9
  ADD r11, r9          ; r11 = body start

  ; Copy body to BODY_BUF
  LDI r14, BODY_BUF   ; dst
  LDI r15, 0          ; body count

http_strip_copy:
  LOAD r5, r11       ; char from body
  JZ r5, http_strip_copy_done
  STORE r14, r5      ; copy to body buffer
  ADD r11, r9
  ADD r14, r9
  ADD r15, r9
  JMP http_strip_copy

http_strip_copy_done:
  ; Null-terminate body
  LDI r5, 0
  STORE r14, r5

  ; Update BODY_LEN to actual body length
  LDI r11, BODY_LEN
  STORE r11, r15

  POP r31
  RET

http_strip_next:
  ADD r11, r9
  ADD r0, r9
  JMP http_strip_scan

http_strip_no_body:
  ; No body found -- set body_len = 0, null-terminate body buf
  LDI r11, BODY_BUF
  LDI r6, 0
  STORE r11, r6
  LDI r11, BODY_LEN
  STORE r11, r6

  POP r31
  RET


; ═══════════════════════════════════════════════
; http_close -- Disconnect and clean up
; ═══════════════════════════════════════════════
http_close:
  PUSH r31
  LDI r11, FD_CELL
  LOAD r11, r11
  DISCONNECT r11
  POP r31
  RET


; ═══════════════════════════════════════════════
; http_get -- Full HTTP GET in one call
;
; Input:  URL string at URL_BUF (0x6000)
; Output: BODY_BUF (0x9000), BODY_LEN, STATUS_CELL
;         r12 = 0 on success
;
; This is the main entry point combining all steps.
; ═══════════════════════════════════════════════
http_get:
  PUSH r31

  ; Step 1: Parse URL
  CALL url_parse

  ; Step 2: Connect
  CALL http_connect

  ; Check connection result (r12 should be NET_OK = 0)
  JNZ r12, http_get_fail

  ; Step 3: Send GET request
  CALL http_send_get

  ; Check send result
  JNZ r12, http_get_close_fail

  ; Step 4: Receive response
  CALL http_recv_response

  ; Step 5: Strip headers, extract body
  CALL http_strip_headers

  ; Step 6: Close connection
  CALL http_close

  ; Success
  LDI r12, 0
  POP r31
  RET

http_get_close_fail:
  CALL http_close

http_get_fail:
  ; r12 already has error code
  POP r31
  RET
