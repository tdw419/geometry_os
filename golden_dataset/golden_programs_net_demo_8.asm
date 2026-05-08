; DESCRIPTION: Render a colored object at the screen.

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
  LDI r8, 10
  LDI r13, 10
  LDI r15, title
  TEXT r8, r13, r15

  ; Draw "Connecting..." message
  LDI r8, 10
  LDI r13, 30
  LDI r15, msg_connecting
  TEXT r8, r13, r15

  ; Store IP address string at 0x7000
  LDI r8, IP_ADDR
  LDI r13, 49        ; '1'
  STORE r8, r13
  LDI r13, 50        ; '2'
  LDI r15, IP_ADDR
  ADD r15, r15, r8
  ADD r15, r15, r8
  STORE r15, r13      ; 0x7002 = '2'
  LDI r13, 55        ; '7'
  LDI r15, IP_ADDR
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  STORE r15, r13      ; 0x7003 = '7'
  LDI r13, 46        ; '.'
  LDI r15, IP_ADDR
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  STORE r15, r13      ; 0x7004 = '.'
  LDI r13, 48        ; '0'
  LDI r15, IP_ADDR
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  STORE r15, r13      ; 0x7005 = '0'
  LDI r13, 46        ; '.'
  LDI r15, IP_ADDR
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  STORE r15, r13      ; 0x7006 = '.'
  LDI r13, 48        ; '0'
  LDI r15, IP_ADDR
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  STORE r15, r13      ; 0x7007 = '0'
  LDI r13, 46        ; '.'
  LDI r15, IP_ADDR
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  STORE r15, r13      ; 0x7008 = '.'
  LDI r13, 49        ; '1'
  LDI r15, IP_ADDR
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  STORE r15, r13      ; 0x7009 = '1'
  LDI r13, 0         ; null terminator
  LDI r15, IP_ADDR
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  ADD r15, r15, r8
  STORE r15, r13      ; 0x700A = null

  ; CONNECT addr_reg, port_reg, fd_reg
  LDI r8, IP_ADDR
  LDI r13, PORT
  CONNECT r8, r13, r15

  ; Check if connect succeeded (r3 == 0)
  CMP r3, r3
  JNZ connect_fail

  ; Draw "Connected!" message
  LDI r8, 10
  LDI r13, 40
  LDI r15, msg_connected
  TEXT r8, r13, r15

  ; Store "Hello from Geometry OS!" in send buffer
  LDI r8, SEND_BUF
  LDI r13, 72        ; 'H'
  STORE r8, r13
  LDI r13, 101       ; 'e'
  ADD r8, r8, r15
  STORE r8, r13      ; 'e'
  LDI r13, 108       ; 'l'
  ADD r8, r8, r15
  STORE r8, r13      ; 'l'
  LDI r13, 108       ; 'l'
  ADD r8, r8, r15
  STORE r8, r13      ; 'l'
  LDI r13, 111       ; 'o'
  ADD r8, r8, r15
  STORE r8, r13      ; 'o'
  LDI r13, 32        ; ' '
  ADD r8, r8, r15
  STORE r8, r13      ; ' '
  LDI r13, 102       ; 'f'
  ADD r8, r8, r15
  STORE r8, r13      ; 'f'
  LDI r13, 114       ; 'r'
  ADD r8, r8, r15
  STORE r8, r13      ; 'r'
  LDI r13, 111       ; 'o'
  ADD r8, r8, r15
  STORE r8, r13      ; 'o'
  LDI r13, 109       ; 'm'
  ADD r8, r8, r15
  STORE r8, r13      ; 'm'
  LDI r13, 32        ; ' '
  ADD r8, r8, r15
  STORE r8, r13      ; ' '
  LDI r13, 71        ; 'G'
  ADD r8, r8, r15
  STORE r8, r13      ; 'G'
  LDI r13, 101       ; 'e'
  ADD r8, r8, r15
  STORE r8, r13      ; 'e'
  LDI r13, 111       ; 'o'
  ADD r8, r8, r15
  STORE r8, r13      ; 'o'
  LDI r13, 109       ; 'm'
  ADD r8, r8, r15
  STORE r8, r13      ; 'm'
  LDI r13, 101       ; 'e'
  ADD r8, r8, r15
  STORE r8, r13      ; 'e'
  LDI r13, 116       ; 't'
  ADD r8, r8, r15
  STORE r8, r13      ; 't'
  LDI r13, 114       ; 'r'
  ADD r8, r8, r15
  STORE r8, r13      ; 'r'
  LDI r13, 121       ; 'y'
  ADD r8, r8, r15
  STORE r8, r13      ; 'y'
  LDI r13, 32        ; ' '
  ADD r8, r8, r15
  STORE r8, r13      ; ' '
  LDI r13, 79        ; 'O'
  ADD r8, r8, r15
  STORE r8, r13      ; 'O'
  LDI r13, 83        ; 'S'
  ADD r8, r8, r15
  STORE r8, r13      ; 'S'
  LDI r13, 33        ; '!'
  ADD r8, r8, r15
  STORE r8, r13      ; '!'

  ; Draw "Sent:" message
  LDI r8, 10
  LDI r13, 50
  LDI r15, msg_sent
  TEXT r8, r13, r15

  ; Draw the sent message
  LDI r8, 50
  LDI r13, 50
  LDI r15, SEND_BUF
  TEXT r8, r13, r15

  ; SOCKSEND fd_reg, buf_reg, len_reg, sent_reg
  ; r15 = fd from CONNECT
  LDI r8, SEND_BUF
  LDI r13, 23        ; length of "Hello from Geometry OS!"
  SOCKSEND r15, r8, r13, r0

  ; Wait a moment for echo (100 frames = ~1.6 seconds)
  LDI r2, 100
wait_loop:
  FRAME
  SUB r2, r2, r15
  CMP r2, r15
  JNZ wait_loop
  CMP r2, r15
  JZ wait_done
  JMP wait_loop

wait_done:
  ; SOCKRECV fd_reg, buf_reg, max_len_reg, recv_reg
  LDI r8, RECV_BUF
  LDI r13, 200
  SOCKRECV r15, r8, r13, r0

  ; Draw "Received:" message
  LDI r8, 10
  LDI r13, 60
  LDI r15, msg_recv
  TEXT r8, r13, r15

  ; Draw the received message
  LDI r8, 60
  LDI r13, 60
  LDI r15, RECV_BUF
  TEXT r8, r13, r15

  ; Disconnect
  DISCONNECT r15

  ; Draw "Done!" message
  LDI r8, 10
  LDI r13, 80
  LDI r15, msg_done
  TEXT r8, r13, r15

  HALT

connect_fail:
  ; Draw error message
  LDI r8, 10
  LDI r13, 40
  LDI r15, msg_error
  TEXT r8, r13, r15
  HALT

title:
  TEXTI "=== TCP Networking Demo ==="

msg_connecting:
  TEXTI "Connecting to 127.0.0.1:8888..."

msg_connected:
  TEXTI "Connected! (fd stored in r15)"

msg_sent:
  TEXTI "Sent:"

msg_recv:
  TEXTI "Echo:"

msg_done:
  TEXTI "Done! Connection closed."

msg_error:
  TEXTI "ERROR: Could not connect."
