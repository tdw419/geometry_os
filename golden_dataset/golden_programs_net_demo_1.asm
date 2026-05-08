; DESCRIPTION: This GeOS assembly code implements a TCP client that connects to an echo server on `127.0.0.1:8888`, sends the message "Hello from Geometry OS!", receives the echoed message, and displays it on the screen. If the connection fails, it displays an error message.

; net_demo.asm -- TCP Networking Demo for Geometry OS
; Connects to an echo server, sends a message, receives the echo, displays it.
;
; Usage: Start an echo server first:
;   python3 -c "import socket; s=socket.socket(); s.bind(('127.0.0.1', 8888)); s.listen(1); c,_=s.accept(); c.settimeout(5); [c.sendall(c.recv(4096)) for _ in iter(int,1)]"
;   Then run this program with F5.
;
; Memory layout:
;   0x7000..0x7010  server IP string ("127.0.0.1")
;   0x7100..0x71FF  send buffer
;   0x7200..0x72FF  receive buffer

#define IP_ADDR      0x7000
#define SEND_BUF     0x7100
#define RECV_BUF     0x7200
#define PORT         8888

  ; Draw title
  LDI r6, 10
  LDI r7, 10
  LDI r14, title
  TEXT r6, r7, r14

  ; Draw "Connecting..." message
  LDI r6, 10
  LDI r7, 30
  LDI r14, msg_connecting
  TEXT r6, r7, r14

  ; Store IP address string at 0x7000
  LDI r6, IP_ADDR
  LDI r7, 49        ; '1'
  STORE r6, r7
  LDI r7, 50        ; '2'
  LDI r14, IP_ADDR
  ADD r14, r14, r6
  ADD r14, r14, r6
  STORE r14, r7      ; 0x7002 = '2'
  LDI r7, 55        ; '7'
  LDI r14, IP_ADDR
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  STORE r14, r7      ; 0x7003 = '7'
  LDI r7, 46        ; '.'
  LDI r14, IP_ADDR
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  STORE r14, r7      ; 0x7004 = '.'
  LDI r7, 48        ; '0'
  LDI r14, IP_ADDR
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  STORE r14, r7      ; 0x7005 = '0'
  LDI r7, 46        ; '.'
  LDI r14, IP_ADDR
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  STORE r14, r7      ; 0x7006 = '.'
  LDI r7, 48        ; '0'
  LDI r14, IP_ADDR
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  STORE r14, r7      ; 0x7007 = '0'
  LDI r7, 46        ; '.'
  LDI r14, IP_ADDR
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  STORE r14, r7      ; 0x7008 = '.'
  LDI r7, 49        ; '1'
  LDI r14, IP_ADDR
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  STORE r14, r7      ; 0x7009 = '1'
  LDI r7, 0         ; null terminator
  LDI r14, IP_ADDR
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  ADD r14, r14, r6
  STORE r14, r7      ; 0x700A = null

  ; CONNECT addr_reg, port_reg, fd_reg
  LDI r6, IP_ADDR
  LDI r7, PORT
  CONNECT r6, r7, r14

  ; Check if connect succeeded (r10 == 0)
  CMP r10, r10
  JNZ connect_fail

  ; Draw "Connected!" message
  LDI r6, 10
  LDI r7, 40
  LDI r14, msg_connected
  TEXT r6, r7, r14

  ; Store "Hello from Geometry OS!" in send buffer
  LDI r6, SEND_BUF
  LDI r7, 72        ; 'H'
  STORE r6, r7
  LDI r7, 101       ; 'e'
  ADD r6, r6, r14
  STORE r6, r7      ; 'e'
  LDI r7, 108       ; 'l'
  ADD r6, r6, r14
  STORE r6, r7      ; 'l'
  LDI r7, 108       ; 'l'
  ADD r6, r6, r14
  STORE r6, r7      ; 'l'
  LDI r7, 111       ; 'o'
  ADD r6, r6, r14
  STORE r6, r7      ; 'o'
  LDI r7, 32        ; ' '
  ADD r6, r6, r14
  STORE r6, r7      ; ' '
  LDI r7, 102       ; 'f'
  ADD r6, r6, r14
  STORE r6, r7      ; 'f'
  LDI r7, 114       ; 'r'
  ADD r6, r6, r14
  STORE r6, r7      ; 'r'
  LDI r7, 111       ; 'o'
  ADD r6, r6, r14
  STORE r6, r7      ; 'o'
  LDI r7, 109       ; 'm'
  ADD r6, r6, r14
  STORE r6, r7      ; 'm'
  LDI r7, 32        ; ' '
  ADD r6, r6, r14
  STORE r6, r7      ; ' '
  LDI r7, 71        ; 'G'
  ADD r6, r6, r14
  STORE r6, r7      ; 'G'
  LDI r7, 101       ; 'e'
  ADD r6, r6, r14
  STORE r6, r7      ; 'e'
  LDI r7, 111       ; 'o'
  ADD r6, r6, r14
  STORE r6, r7      ; 'o'
  LDI r7, 109       ; 'm'
  ADD r6, r6, r14
  STORE r6, r7      ; 'm'
  LDI r7, 101       ; 'e'
  ADD r6, r6, r14
  STORE r6, r7      ; 'e'
  LDI r7, 116       ; 't'
  ADD r6, r6, r14
  STORE r6, r7      ; 't'
  LDI r7, 114       ; 'r'
  ADD r6, r6, r14
  STORE r6, r7      ; 'r'
  LDI r7, 121       ; 'y'
  ADD r6, r6, r14
  STORE r6, r7      ; 'y'
  LDI r7, 32        ; ' '
  ADD r6, r6, r14
  STORE r6, r7      ; ' '
  LDI r7, 79        ; 'O'
  ADD r6, r6, r14
  STORE r6, r7      ; 'O'
  LDI r7, 83        ; 'S'
  ADD r6, r6, r14
  STORE r6, r7      ; 'S'
  LDI r7, 33        ; '!'
  ADD r6, r6, r14
  STORE r6, r7      ; '!'

  ; Draw "Sent:" message
  LDI r6, 10
  LDI r7, 50
  LDI r14, msg_sent
  TEXT r6, r7, r14

  ; Draw the sent message
  LDI r6, 50
  LDI r7, 50
  LDI r14, SEND_BUF
  TEXT r6, r7, r14

  ; SOCKSEND fd_reg, buf_reg, len_reg, sent_reg
  ; r14 = fd from CONNECT
  LDI r6, SEND_BUF
  LDI r7, 23        ; length of "Hello from Geometry OS!"
  SOCKSEND r14, r6, r7, r4

  ; Wait a moment for echo (100 frames = ~1.6 seconds)
  LDI r15, 100
wait_loop:
  FRAME
  SUB r15, r15, r14
  CMP r15, r14
  JNZ wait_loop
  CMP r15, r14
  JZ wait_done
  JMP wait_loop

wait_done:
  ; SOCKRECV fd_reg, buf_reg, max_len_reg, recv_reg
  LDI r6, RECV_BUF
  LDI r7, 200
  SOCKRECV r14, r6, r7, r4

  ; Draw "Received:" message
  LDI r6, 10
  LDI r7, 60
  LDI r14, msg_recv
  TEXT r6, r7, r14

  ; Draw the received message
  LDI r6, 60
  LDI r7, 60
  LDI r14, RECV_BUF
  TEXT r6, r7, r14

  ; Disconnect
  DISCONNECT r14

  ; Draw "Done!" message
  LDI r6, 10
  LDI r7, 80
  LDI r14, msg_done
  TEXT r6, r7, r14

  HALT

connect_fail:
  ; Draw error message
  LDI r6, 10
  LDI r7, 40
  LDI r14, msg_error
  TEXT r6, r7, r14
  HALT

title:
  TEXTI "=== TCP Networking Demo ==="

msg_connecting:
  TEXTI "Connecting to 127.0.0.1:8888..."

msg_connected:
  TEXTI "Connected! (fd stored in r14)"

msg_sent:
  TEXTI "Sent:"

msg_recv:
  TEXTI "Echo:"

msg_done:
  TEXTI "Done! Connection closed."

msg_error:
  TEXTI "ERROR: Could not connect."
