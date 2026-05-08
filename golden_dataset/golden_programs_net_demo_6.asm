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
  LDI r11, 10
  LDI r12, 10
  LDI r10, title
  TEXT r11, r12, r10

  ; Draw "Connecting..." message
  LDI r11, 10
  LDI r12, 30
  LDI r10, msg_connecting
  TEXT r11, r12, r10

  ; Store IP address string at 0x7000
  LDI r11, IP_ADDR
  LDI r12, 49        ; '1'
  STORE r11, r12
  LDI r12, 50        ; '2'
  LDI r10, IP_ADDR
  ADD r10, r10, r11
  ADD r10, r10, r11
  STORE r10, r12      ; 0x7002 = '2'
  LDI r12, 55        ; '7'
  LDI r10, IP_ADDR
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  STORE r10, r12      ; 0x7003 = '7'
  LDI r12, 46        ; '.'
  LDI r10, IP_ADDR
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  STORE r10, r12      ; 0x7004 = '.'
  LDI r12, 48        ; '0'
  LDI r10, IP_ADDR
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  STORE r10, r12      ; 0x7005 = '0'
  LDI r12, 46        ; '.'
  LDI r10, IP_ADDR
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  STORE r10, r12      ; 0x7006 = '.'
  LDI r12, 48        ; '0'
  LDI r10, IP_ADDR
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  STORE r10, r12      ; 0x7007 = '0'
  LDI r12, 46        ; '.'
  LDI r10, IP_ADDR
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  STORE r10, r12      ; 0x7008 = '.'
  LDI r12, 49        ; '1'
  LDI r10, IP_ADDR
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  STORE r10, r12      ; 0x7009 = '1'
  LDI r12, 0         ; null terminator
  LDI r10, IP_ADDR
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  ADD r10, r10, r11
  STORE r10, r12      ; 0x700A = null

  ; CONNECT addr_reg, port_reg, fd_reg
  LDI r11, IP_ADDR
  LDI r12, PORT
  CONNECT r11, r12, r10

  ; Check if connect succeeded (r15 == 0)
  CMP r15, r15
  JNZ connect_fail

  ; Draw "Connected!" message
  LDI r11, 10
  LDI r12, 40
  LDI r10, msg_connected
  TEXT r11, r12, r10

  ; Store "Hello from Geometry OS!" in send buffer
  LDI r11, SEND_BUF
  LDI r12, 72        ; 'H'
  STORE r11, r12
  LDI r12, 101       ; 'e'
  ADD r11, r11, r10
  STORE r11, r12      ; 'e'
  LDI r12, 108       ; 'l'
  ADD r11, r11, r10
  STORE r11, r12      ; 'l'
  LDI r12, 108       ; 'l'
  ADD r11, r11, r10
  STORE r11, r12      ; 'l'
  LDI r12, 111       ; 'o'
  ADD r11, r11, r10
  STORE r11, r12      ; 'o'
  LDI r12, 32        ; ' '
  ADD r11, r11, r10
  STORE r11, r12      ; ' '
  LDI r12, 102       ; 'f'
  ADD r11, r11, r10
  STORE r11, r12      ; 'f'
  LDI r12, 114       ; 'r'
  ADD r11, r11, r10
  STORE r11, r12      ; 'r'
  LDI r12, 111       ; 'o'
  ADD r11, r11, r10
  STORE r11, r12      ; 'o'
  LDI r12, 109       ; 'm'
  ADD r11, r11, r10
  STORE r11, r12      ; 'm'
  LDI r12, 32        ; ' '
  ADD r11, r11, r10
  STORE r11, r12      ; ' '
  LDI r12, 71        ; 'G'
  ADD r11, r11, r10
  STORE r11, r12      ; 'G'
  LDI r12, 101       ; 'e'
  ADD r11, r11, r10
  STORE r11, r12      ; 'e'
  LDI r12, 111       ; 'o'
  ADD r11, r11, r10
  STORE r11, r12      ; 'o'
  LDI r12, 109       ; 'm'
  ADD r11, r11, r10
  STORE r11, r12      ; 'm'
  LDI r12, 101       ; 'e'
  ADD r11, r11, r10
  STORE r11, r12      ; 'e'
  LDI r12, 116       ; 't'
  ADD r11, r11, r10
  STORE r11, r12      ; 't'
  LDI r12, 114       ; 'r'
  ADD r11, r11, r10
  STORE r11, r12      ; 'r'
  LDI r12, 121       ; 'y'
  ADD r11, r11, r10
  STORE r11, r12      ; 'y'
  LDI r12, 32        ; ' '
  ADD r11, r11, r10
  STORE r11, r12      ; ' '
  LDI r12, 79        ; 'O'
  ADD r11, r11, r10
  STORE r11, r12      ; 'O'
  LDI r12, 83        ; 'S'
  ADD r11, r11, r10
  STORE r11, r12      ; 'S'
  LDI r12, 33        ; '!'
  ADD r11, r11, r10
  STORE r11, r12      ; '!'

  ; Draw "Sent:" message
  LDI r11, 10
  LDI r12, 50
  LDI r10, msg_sent
  TEXT r11, r12, r10

  ; Draw the sent message
  LDI r11, 50
  LDI r12, 50
  LDI r10, SEND_BUF
  TEXT r11, r12, r10

  ; SOCKSEND fd_reg, buf_reg, len_reg, sent_reg
  ; r10 = fd from CONNECT
  LDI r11, SEND_BUF
  LDI r12, 23        ; length of "Hello from Geometry OS!"
  SOCKSEND r10, r11, r12, r1

  ; Wait a moment for echo (100 frames = ~1.6 seconds)
  LDI r8, 100
wait_loop:
  FRAME
  SUB r8, r8, r10
  CMP r8, r10
  JNZ wait_loop
  CMP r8, r10
  JZ wait_done
  JMP wait_loop

wait_done:
  ; SOCKRECV fd_reg, buf_reg, max_len_reg, recv_reg
  LDI r11, RECV_BUF
  LDI r12, 200
  SOCKRECV r10, r11, r12, r1

  ; Draw "Received:" message
  LDI r11, 10
  LDI r12, 60
  LDI r10, msg_recv
  TEXT r11, r12, r10

  ; Draw the received message
  LDI r11, 60
  LDI r12, 60
  LDI r10, RECV_BUF
  TEXT r11, r12, r10

  ; Disconnect
  DISCONNECT r10

  ; Draw "Done!" message
  LDI r11, 10
  LDI r12, 80
  LDI r10, msg_done
  TEXT r11, r12, r10

  HALT

connect_fail:
  ; Draw error message
  LDI r11, 10
  LDI r12, 40
  LDI r10, msg_error
  TEXT r11, r12, r10
  HALT

title:
  TEXTI "=== TCP Networking Demo ==="

msg_connecting:
  TEXTI "Connecting to 127.0.0.1:8888..."

msg_connected:
  TEXTI "Connected! (fd stored in r10)"

msg_sent:
  TEXTI "Sent:"

msg_recv:
  TEXTI "Echo:"

msg_done:
  TEXTI "Done! Connection closed."

msg_error:
  TEXTI "ERROR: Could not connect."
