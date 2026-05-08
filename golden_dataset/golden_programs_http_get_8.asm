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
;   r0-r4  -- subroutine arguments/temp (caller-saved)
;   r9-r19  -- subroutine local vars (caller-saved)
;   r20-r29  -- preserved across calls if needed (callee-saved by convention)
;   r30 = SP (grows down from 0xFF00)
;   r31 = LR (link register)
;   r6  = CMP result (DO NOT USE as general register!)

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
  LDI r10, 1           ; increment constant

  ; Initialize port to 80 (default)
  LDI r0, 80
  LDI r12, PORT_CELL
  STORE r12, r0

  ; Initialize path to "/" followed by null
  LDI r12, PATH_BUF
  LDI r0, 47         ; '/'
  STORE r12, r0
  LDI r0, 0
  ADD r12, r10         ; r12 = PATH_BUF + 1
  STORE r12, r0      ; path[1] = null

  ; ── Phase 1: Copy host part until ':' or '/' or null ──
  LDI r0, URL_BUF    ; src = URL start
  LDI r12, HOST_BUF   ; dst = host buffer
  LDI r11, 0          ; host_len = 0

url_parse_host_loop:
  ; Load char from URL
  LOAD r2, r0       ; r2 = url[pos]

  ; Check null -- end of URL
  JZ r2, url_parse_done

  ; Check '/' -- start of path
  LDI r4, 47         ; '/'
  CMP r2, r4
  JZ r6, url_parse_path_start

  ; Check ':' -- start of port
  LDI r4, 58         ; ':'
  CMP r2, r4
  JZ r6, url_parse_port

  ; Copy char to host buffer
  STORE r12, r2
  ADD r0, r10          ; src++
  ADD r12, r10          ; dst++
  ADD r11, r10          ; host_len++
  JMP url_parse_host_loop

url_parse_port:
  ; Skip the ':'
  ADD r0, r10

  ; Null-terminate host
  LDI r2, 0
  STORE r12, r2

  ; Parse port number
  LDI r12, 0          ; port = 0

url_parse_port_loop:
  LOAD r2, r0
  JZ r2, url_parse_port_done

  ; Check '/' -- start of path
  LDI r4, 47
  CMP r2, r4
  JNZ r6, url_parse_port_digit

  ; Found '/' after port -- save port first, then copy path
  LDI r4, PORT_CELL
  STORE r4, r12
  JMP url_parse_path_start

url_parse_port_digit:
  ; port = port * 10 + (char - '0')
  LDI r4, 10
  MUL r12, r4        ; port *= 10
  LDI r4, 48         ; '0'
  SUB r2, r4        ; digit = char - '0'
  ADD r12, r2        ; port += digit

  ADD r0, r10
  JMP url_parse_port_loop

url_parse_port_done:
  ; Store port
  LDI r2, PORT_CELL
  STORE r2, r12
  JMP url_parse_done

url_parse_path_start:
  ; Null-terminate host (safe even if already done)
  ; r12 might be host dst ptr or port value -- use r11 (host_len) instead
  LDI r2, HOST_BUF
  ADD r2, r11         ; r2 = HOST_BUF + host_len
  LDI r4, 0
  STORE r2, r4       ; null-terminate host

  ; Copy remaining URL to path buffer
  LDI r12, PATH_BUF   ; dst = path buffer

url_parse_path_loop:
  LOAD r2, r0       ; char from URL
  JZ r2, url_parse_done
  STORE r12, r2      ; copy to path
  ADD r0, r10
  ADD r12, r10
  JMP url_parse_path_loop

url_parse_done:
  POP r31
  RET


; ═══════════════════════════════════════════════
; http_connect -- Connect to the parsed host:port
;
; Input:  HOST_BUF, PORT_CELL
; Output: FD_CELL = connection fd, r6 = 0 on success
; ═══════════════════════════════════════════════
http_connect:
  PUSH r31

  LDI r0, HOST_BUF   ; addr_reg = pointer to host string
  LDI r12, PORT_CELL
  LOAD r12, r12       ; port_reg = port number

  ; We need to load host address and port into registers
  ; CONNECT addr_reg, port_reg, fd_reg
  ; But CONNECT reads from RAM[addr_reg] as IP string
  ; We need a temp register for the fd output
  LDI r11, FD_CELL    ; will store fd here

  ; CONNECT r0, r12, r11  -- but we need to use register numbers
  ; r0=addr, r12=port, r11=fd_out
  CONNECT r0, r12, r11

  ; Store fd to RAM
  LDI r2, FD_CELL
  STORE r2, r11

  POP r31
  RET


; ═══════════════════════════════════════════════
; http_send_get -- Build and send HTTP GET request
;
; Input:  HOST_BUF, PATH_BUF, FD_CELL
; Output: Request sent via TCP, r6 = 0 on success
;
; Builds: "GET /path HTTP/1.0\r\nHost: host\r\n\r\n"
; ═══════════════════════════════════════════════
http_send_get:
  PUSH r31

  ; Build request string in REQ_BUF (0x6400)
  LDI r0, REQ_BUF    ; dst = request buffer
  LDI r10, 1           ; increment

  ; ── "GET " ──
  LDI r12, 71         ; 'G'
  STORE r0, r12
  ADD r0, r10
  LDI r12, 69         ; 'E'
  STORE r0, r12
  ADD r0, r10
  LDI r12, 84         ; 'T'
  STORE r0, r12
  ADD r0, r10
  LDI r12, 32         ; ' '
  STORE r0, r12
  ADD r0, r10

  ; ── Copy path ──
  LDI r12, PATH_BUF
http_send_path_loop:
  LOAD r11, r12       ; char from path
  JZ r11, http_send_path_done
  STORE r0, r11
  ADD r0, r10
  ADD r12, r10
  JMP http_send_path_loop

http_send_path_done:
  ; ── " HTTP/1.0\r\nHost: " ──
  ; ' '
  LDI r12, 32
  STORE r0, r12
  ADD r0, r10
  ; 'H'
  LDI r12, 72
  STORE r0, r12
  ADD r0, r10
  ; 'T'
  LDI r12, 84
  STORE r0, r12
  ADD r0, r10
  ; 'T'
  LDI r12, 84
  STORE r0, r12
  ADD r0, r10
  ; 'P'
  LDI r12, 80
  STORE r0, r12
  ADD r0, r10
  ; '/'
  LDI r12, 47
  STORE r0, r12
  ADD r0, r10
  ; '1'
  LDI r12, 49
  STORE r0, r12
  ADD r0, r10
  ; '.'
  LDI r12, 46
  STORE r0, r12
  ADD r0, r10
  ; '0'
  LDI r12, 48
  STORE r0, r12
  ADD r0, r10
  ; '\r'
  LDI r12, 13
  STORE r0, r12
  ADD r0, r10
  ; '\n'
  LDI r12, 10
  STORE r0, r12
  ADD r0, r10
  ; 'H'
  LDI r12, 72
  STORE r0, r12
  ADD r0, r10
  ; 'o'
  LDI r12, 111
  STORE r0, r12
  ADD r0, r10
  ; 's'
  LDI r12, 115
  STORE r0, r12
  ADD r0, r10
  ; 't'
  LDI r12, 116
  STORE r0, r12
  ADD r0, r10
  ; ':'
  LDI r12, 58
  STORE r0, r12
  ADD r0, r10
  ; ' '
  LDI r12, 32
  STORE r0, r12
  ADD r0, r10

  ; ── Copy host ──
  LDI r12, HOST_BUF
http_send_host_loop:
  LOAD r11, r12
  JZ r11, http_send_host_done
  STORE r0, r11
  ADD r0, r10
  ADD r12, r10
  JMP http_send_host_loop

http_send_host_done:
  ; ── "\r\n\r\n" (end of headers) ──
  LDI r12, 13         ; '\r'
  STORE r0, r12
  ADD r0, r10
  LDI r12, 10         ; '\n'
  STORE r0, r12
  ADD r0, r10
  LDI r12, 13         ; '\r'
  STORE r0, r12
  ADD r0, r10
  LDI r12, 10         ; '\n'
  STORE r0, r12
  ADD r0, r10

  ; Null-terminate request for safety
  LDI r12, 0
  STORE r0, r12

  ; ── Calculate request length ──
  LDI r12, REQ_BUF
  SUB r0, r12        ; r0 = request length (dst - base)

  ; ── Send via TCP ──
  LDI r12, FD_CELL
  LOAD r12, r12       ; r12 = fd
  LDI r11, REQ_BUF    ; r11 = buf addr
  ; r0 = length
  ; SOCKSEND fd_reg, buf_reg, len_reg, sent_reg
  SOCKSEND r12, r11, r0, r2

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

  LDI r0, 0          ; total_received = 0
  LDI r10, 1           ; increment

  ; Store initial body_len = 0
  LDI r12, BODY_LEN
  STORE r12, r0

http_recv_loop:
  ; Check if buffer is full
  LDI r12, RESP_MAX
  CMP r0, r12
  BGE r6, http_recv_done

  ; Calculate remaining buffer space
  LDI r12, RESP_MAX
  SUB r12, r0        ; remaining = RESP_MAX - total

  ; SOCKRECV fd, buf_addr, remaining, received
  LDI r11, FD_CELL
  LOAD r11, r11       ; r11 = fd

  ; Calculate write address: RESP_BUF + total_received
  LDI r2, RESP_BUF
  ADD r2, r0        ; r2 = buf addr

  ; r12 = remaining (max_len)
  SOCKRECV r11, r2, r12, r4

  ; Check result
  ; r6 = status: 0=OK, 6=would_block, 7=closed
  JZ r6, http_recv_got_data

  ; Connection closed -- done
  LDI r12, 7          ; NET_ERR_CONNECTION_CLOSED
  CMP r6, r12
  JZ r6, http_recv_done

  ; Would block -- yield a frame and retry
  FRAME
  JMP http_recv_loop

http_recv_got_data:
  ; r4 = bytes received
  ADD r0, r4        ; total += received

  ; Update body_len
  LDI r12, BODY_LEN
  STORE r12, r0

  ; Check if received 0 bytes (shouldn't happen, but safety)
  JZ r4, http_recv_done

  ; Continue reading
  JMP http_recv_loop

http_recv_done:
  ; Null-terminate response buffer at total_received position
  LDI r12, RESP_BUF
  ADD r12, r0
  LDI r11, 0
  STORE r12, r11

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
  LDI r0, RESP_BUF
  LDI r10, 1
  LDI r12, 9
  ADD r0, r12        ; r0 points to status code digits

  ; Parse 3-digit status: code = d1*100 + d2*10 + d3
  LOAD r11, r0       ; first digit
  LDI r12, 48
  SUB r11, r12        ; d1 = char - '0'
  LDI r12, 100
  MUL r11, r12        ; d1 * 100
  LDI r2, STATUS_CELL
  STORE r2, r11      ; partial status

  ADD r0, r10
  LOAD r11, r0       ; second digit
  LDI r12, 48
  SUB r11, r12        ; d2 = char - '0'
  LDI r12, 10
  MUL r11, r12        ; d2 * 10
  LDI r2, STATUS_CELL
  LOAD r2, r2
  ADD r2, r11
  LDI r11, STATUS_CELL
  STORE r11, r2      ; status += d2*10

  ADD r0, r10
  LOAD r11, r0       ; third digit
  LDI r12, 48
  SUB r11, r12        ; d3 = char - '0'
  LDI r2, STATUS_CELL
  LOAD r2, r2
  ADD r2, r11
  LDI r11, STATUS_CELL
  STORE r11, r2      ; status += d3

  ; ── Find \r\n\r\n delimiter ──
  LDI r0, RESP_BUF   ; scan position
  LDI r12, BODY_LEN
  LOAD r12, r12       ; response length
  LDI r11, 0          ; bytes scanned

http_strip_scan:
  ; Check if we've scanned enough (need at least 4 more bytes for \r\n\r\n)
  CMP r11, r12
  BGE r6, http_strip_no_body

  ; Check for \r\n\r\n pattern
  LOAD r2, r0       ; char[pos]
  LDI r4, 13         ; '\r'
  CMP r2, r4
  JNZ r6, http_strip_next

  ; Found \r, check \n\r\n
  MOV r9, r0
  ADD r9, r10
  LOAD r2, r9       ; char[pos+1]
  LDI r4, 10         ; '\n'
  CMP r2, r4
  JNZ r6, http_strip_next

  ADD r9, r10
  LOAD r2, r9       ; char[pos+2]
  LDI r4, 13         ; '\r'
  CMP r2, r4
  JNZ r6, http_strip_next

  ADD r9, r10
  LOAD r2, r9       ; char[pos+3]
  LDI r4, 10         ; '\n'
  CMP r2, r4
  JNZ r6, http_strip_next

  ; Found \r\n\r\n at pos! Body starts at pos+4
  ADD r0, r10
  ADD r0, r10
  ADD r0, r10
  ADD r0, r10          ; r0 = body start

  ; Copy body to BODY_BUF
  LDI r2, BODY_BUF   ; dst
  LDI r9, 0          ; body count

http_strip_copy:
  LOAD r4, r0       ; char from body
  JZ r4, http_strip_copy_done
  STORE r2, r4      ; copy to body buffer
  ADD r0, r10
  ADD r2, r10
  ADD r9, r10
  JMP http_strip_copy

http_strip_copy_done:
  ; Null-terminate body
  LDI r4, 0
  STORE r2, r4

  ; Update BODY_LEN to actual body length
  LDI r0, BODY_LEN
  STORE r0, r9

  POP r31
  RET

http_strip_next:
  ADD r0, r10
  ADD r11, r10
  JMP http_strip_scan

http_strip_no_body:
  ; No body found -- set body_len = 0, null-terminate body buf
  LDI r0, BODY_BUF
  LDI r12, 0
  STORE r0, r12
  LDI r0, BODY_LEN
  STORE r0, r12

  POP r31
  RET


; ═══════════════════════════════════════════════
; http_close -- Disconnect and clean up
; ═══════════════════════════════════════════════
http_close:
  PUSH r31
  LDI r0, FD_CELL
  LOAD r0, r0
  DISCONNECT r0
  POP r31
  RET


; ═══════════════════════════════════════════════
; http_get -- Full HTTP GET in one call
;
; Input:  URL string at URL_BUF (0x6000)
; Output: BODY_BUF (0x9000), BODY_LEN, STATUS_CELL
;         r6 = 0 on success
;
; This is the main entry point combining all steps.
; ═══════════════════════════════════════════════
http_get:
  PUSH r31

  ; Step 1: Parse URL
  CALL url_parse

  ; Step 2: Connect
  CALL http_connect

  ; Check connection result (r6 should be NET_OK = 0)
  JNZ r6, http_get_fail

  ; Step 3: Send GET request
  CALL http_send_get

  ; Check send result
  JNZ r6, http_get_close_fail

  ; Step 4: Receive response
  CALL http_recv_response

  ; Step 5: Strip headers, extract body
  CALL http_strip_headers

  ; Step 6: Close connection
  CALL http_close

  ; Success
  LDI r6, 0
  POP r31
  RET

http_get_close_fail:
  CALL http_close

http_get_fail:
  ; r6 already has error code
  POP r31
  RET
