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
  LDI r12, 10
  LDI r15, 10
  LDI r0, title
  TEXT r12, r15, r0

  ; Draw "Connecting..." message
  LDI r12, 10
  LDI r15, 30
  LDI r0, msg_connecting
  TEXT r12, r15, r0

  ; Store IP address string at 0x7000
  LDI r12, IP_ADDR
  LDI r15, 49        ; '1'
  STORE r12, r15
  LDI r15, 50        ; '2'
  LDI r0, IP_ADDR
  ADD r0, r0, r12
  ADD r0, r0, r12
  STORE r0, r15      ; 0x7002 = '2'
  LDI r15, 55        ; '7'
  LDI r0, IP_ADDR
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  STORE r0, r15      ; 0x7003 = '7'
  LDI r15, 46        ; '.'
  LDI r0, IP_ADDR
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  STORE r0, r15      ; 0x7004 = '.'
  LDI r15, 48        ; '0'
  LDI r0, IP_ADDR
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  STORE r0, r15      ; 0x7005 = '0'
  LDI r15, 46        ; '.'
  LDI r0, IP_ADDR
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  STORE r0, r15      ; 0x7006 = '.'
  LDI r15, 48        ; '0'
  LDI r0, IP_ADDR
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  STORE r0, r15      ; 0x7007 = '0'
  LDI r15, 46        ; '.'
  LDI r0, IP_ADDR
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  STORE r0, r15      ; 0x7008 = '.'
  LDI r15, 49        ; '1'
  LDI r0, IP_ADDR
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  STORE r0, r15      ; 0x7009 = '1'
  LDI r15, 0         ; null terminator
  LDI r0, IP_ADDR
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  ADD r0, r0, r12
  STORE r0, r15      ; 0x700A = null

  ; CONNECT addr_reg, port_reg, fd_reg
  LDI r12, IP_ADDR
  LDI r15, PORT
  CONNECT r12, r15, r0

  ; Check if connect succeeded (r14 == 0)
  CMP r14, r14
  JNZ connect_fail

  ; Draw "Connected!" message
  LDI r12, 10
  LDI r15, 40
  LDI r0, msg_connected
  TEXT r12, r15, r0

  ; Store "Hello from Geometry OS!" in send buffer
  LDI r12, SEND_BUF
  LDI r15, 72        ; 'H'
  STORE r12, r15
  LDI r15, 101       ; 'e'
  ADD r12, r12, r0
  STORE r12, r15      ; 'e'
  LDI r15, 108       ; 'l'
  ADD r12, r12, r0
  STORE r12, r15      ; 'l'
  LDI r15, 108       ; 'l'
  ADD r12, r12, r0
  STORE r12, r15      ; 'l'
  LDI r15, 111       ; 'o'
  ADD r12, r12, r0
  STORE r12, r15      ; 'o'
  LDI r15, 32        ; ' '
  ADD r12, r12, r0
  STORE r12, r15      ; ' '
  LDI r15, 102       ; 'f'
  ADD r12, r12, r0
  STORE r12, r15      ; 'f'
  LDI r15, 114       ; 'r'
  ADD r12, r12, r0
  STORE r12, r15      ; 'r'
  LDI r15, 111       ; 'o'
  ADD r12, r12, r0
  STORE r12, r15      ; 'o'
  LDI r15, 109       ; 'm'
  ADD r12, r12, r0
  STORE r12, r15      ; 'm'
  LDI r15, 32        ; ' '
  ADD r12, r12, r0
  STORE r12, r15      ; ' '
  LDI r15, 71        ; 'G'
  ADD r12, r12, r0
  STORE r12, r15      ; 'G'
  LDI r15, 101       ; 'e'
  ADD r12, r12, r0
  STORE r12, r15      ; 'e'
  LDI r15, 111       ; 'o'
  ADD r12, r12, r0
  STORE r12, r15      ; 'o'
  LDI r15, 109       ; 'm'
  ADD r12, r12, r0
  STORE r12, r15      ; 'm'
  LDI r15, 101       ; 'e'
  ADD r12, r12, r0
  STORE r12, r15      ; 'e'
  LDI r15, 116       ; 't'
  ADD r12, r12, r0
  STORE r12, r15      ; 't'
  LDI r15, 114       ; 'r'
  ADD r12, r12, r0
  STORE r12, r15      ; 'r'
  LDI r15, 121       ; 'y'
  ADD r12, r12, r0
  STORE r12, r15      ; 'y'
  LDI r15, 32        ; ' '
  ADD r12, r12, r0
  STORE r12, r15      ; ' '
  LDI r15, 79        ; 'O'
  ADD r12, r12, r0
  STORE r12, r15      ; 'O'
  LDI r15, 83        ; 'S'
  ADD r12, r12, r0
  STORE r12, r15      ; 'S'
  LDI r15, 33        ; '!'
  ADD r12, r12, r0
  STORE r12, r15      ; '!'

  ; Draw "Sent:" message
  LDI r12, 10
  LDI r15, 50
  LDI r0, msg_sent
  TEXT r12, r15, r0

  ; Draw the sent message
  LDI r12, 50
  LDI r15, 50
  LDI r0, SEND_BUF
  TEXT r12, r15, r0

  ; SOCKSEND fd_reg, buf_reg, len_reg, sent_reg
  ; r0 = fd from CONNECT
  LDI r12, SEND_BUF
  LDI r15, 23        ; length of "Hello from Geometry OS!"
  SOCKSEND r0, r12, r15, r1

  ; Wait a moment for echo (100 frames = ~1.6 seconds)
  LDI r7, 100
wait_loop:
  FRAME
  SUB r7, r7, r0
  CMP r7, r0
  JNZ wait_loop
  CMP r7, r0
  JZ wait_done
  JMP wait_loop

wait_done:
  ; SOCKRECV fd_reg, buf_reg, max_len_reg, recv_reg
  LDI r12, RECV_BUF
  LDI r15, 200
  SOCKRECV r0, r12, r15, r1

  ; Draw "Received:" message
  LDI r12, 10
  LDI r15, 60
  LDI r0, msg_recv
  TEXT r12, r15, r0

  ; Draw the received message
  LDI r12, 60
  LDI r15, 60
  LDI r0, RECV_BUF
  TEXT r12, r15, r0

  ; Disconnect
  DISCONNECT r0

  ; Draw "Done!" message
  LDI r12, 10
  LDI r15, 80
  LDI r0, msg_done
  TEXT r12, r15, r0

  HALT

connect_fail:
  ; Draw error message
  LDI r12, 10
  LDI r15, 40
  LDI r0, msg_error
  TEXT r12, r15, r0
  HALT

title:
  TEXTI "=== TCP Networking Demo ==="

msg_connecting:
  TEXTI "Connecting to 127.0.0.1:8888..."

msg_connected:
  TEXTI "Connected! (fd stored in r0)"

msg_sent:
  TEXTI "Sent:"

msg_recv:
  TEXTI "Echo:"

msg_done:
  TEXTI "Done! Connection closed."

msg_error:
  TEXTI "ERROR: Could not connect."
