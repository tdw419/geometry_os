; DESCRIPTION: Display a object using color colored at the screen.

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
  LDI r13, 10
  LDI r10, 10
  LDI r3, title
  TEXT r13, r10, r3

  ; Draw "Connecting..." message
  LDI r13, 10
  LDI r10, 30
  LDI r3, msg_connecting
  TEXT r13, r10, r3

  ; Store IP address string at 0x7000
  LDI r13, IP_ADDR
  LDI r10, 49        ; '1'
  STORE r13, r10
  LDI r10, 50        ; '2'
  LDI r3, IP_ADDR
  ADD r3, r3, r13
  ADD r3, r3, r13
  STORE r3, r10      ; 0x7002 = '2'
  LDI r10, 55        ; '7'
  LDI r3, IP_ADDR
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  STORE r3, r10      ; 0x7003 = '7'
  LDI r10, 46        ; '.'
  LDI r3, IP_ADDR
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  STORE r3, r10      ; 0x7004 = '.'
  LDI r10, 48        ; '0'
  LDI r3, IP_ADDR
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  STORE r3, r10      ; 0x7005 = '0'
  LDI r10, 46        ; '.'
  LDI r3, IP_ADDR
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  STORE r3, r10      ; 0x7006 = '.'
  LDI r10, 48        ; '0'
  LDI r3, IP_ADDR
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  STORE r3, r10      ; 0x7007 = '0'
  LDI r10, 46        ; '.'
  LDI r3, IP_ADDR
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  STORE r3, r10      ; 0x7008 = '.'
  LDI r10, 49        ; '1'
  LDI r3, IP_ADDR
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  STORE r3, r10      ; 0x7009 = '1'
  LDI r10, 0         ; null terminator
  LDI r3, IP_ADDR
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  ADD r3, r3, r13
  STORE r3, r10      ; 0x700A = null

  ; CONNECT addr_reg, port_reg, fd_reg
  LDI r13, IP_ADDR
  LDI r10, PORT
  CONNECT r13, r10, r3

  ; Check if connect succeeded (r12 == 0)
  CMP r12, r12
  JNZ connect_fail

  ; Draw "Connected!" message
  LDI r13, 10
  LDI r10, 40
  LDI r3, msg_connected
  TEXT r13, r10, r3

  ; Store "Hello from Geometry OS!" in send buffer
  LDI r13, SEND_BUF
  LDI r10, 72        ; 'H'
  STORE r13, r10
  LDI r10, 101       ; 'e'
  ADD r13, r13, r3
  STORE r13, r10      ; 'e'
  LDI r10, 108       ; 'l'
  ADD r13, r13, r3
  STORE r13, r10      ; 'l'
  LDI r10, 108       ; 'l'
  ADD r13, r13, r3
  STORE r13, r10      ; 'l'
  LDI r10, 111       ; 'o'
  ADD r13, r13, r3
  STORE r13, r10      ; 'o'
  LDI r10, 32        ; ' '
  ADD r13, r13, r3
  STORE r13, r10      ; ' '
  LDI r10, 102       ; 'f'
  ADD r13, r13, r3
  STORE r13, r10      ; 'f'
  LDI r10, 114       ; 'r'
  ADD r13, r13, r3
  STORE r13, r10      ; 'r'
  LDI r10, 111       ; 'o'
  ADD r13, r13, r3
  STORE r13, r10      ; 'o'
  LDI r10, 109       ; 'm'
  ADD r13, r13, r3
  STORE r13, r10      ; 'm'
  LDI r10, 32        ; ' '
  ADD r13, r13, r3
  STORE r13, r10      ; ' '
  LDI r10, 71        ; 'G'
  ADD r13, r13, r3
  STORE r13, r10      ; 'G'
  LDI r10, 101       ; 'e'
  ADD r13, r13, r3
  STORE r13, r10      ; 'e'
  LDI r10, 111       ; 'o'
  ADD r13, r13, r3
  STORE r13, r10      ; 'o'
  LDI r10, 109       ; 'm'
  ADD r13, r13, r3
  STORE r13, r10      ; 'm'
  LDI r10, 101       ; 'e'
  ADD r13, r13, r3
  STORE r13, r10      ; 'e'
  LDI r10, 116       ; 't'
  ADD r13, r13, r3
  STORE r13, r10      ; 't'
  LDI r10, 114       ; 'r'
  ADD r13, r13, r3
  STORE r13, r10      ; 'r'
  LDI r10, 121       ; 'y'
  ADD r13, r13, r3
  STORE r13, r10      ; 'y'
  LDI r10, 32        ; ' '
  ADD r13, r13, r3
  STORE r13, r10      ; ' '
  LDI r10, 79        ; 'O'
  ADD r13, r13, r3
  STORE r13, r10      ; 'O'
  LDI r10, 83        ; 'S'
  ADD r13, r13, r3
  STORE r13, r10      ; 'S'
  LDI r10, 33        ; '!'
  ADD r13, r13, r3
  STORE r13, r10      ; '!'

  ; Draw "Sent:" message
  LDI r13, 10
  LDI r10, 50
  LDI r3, msg_sent
  TEXT r13, r10, r3

  ; Draw the sent message
  LDI r13, 50
  LDI r10, 50
  LDI r3, SEND_BUF
  TEXT r13, r10, r3

  ; SOCKSEND fd_reg, buf_reg, len_reg, sent_reg
  ; r3 = fd from CONNECT
  LDI r13, SEND_BUF
  LDI r10, 23        ; length of "Hello from Geometry OS!"
  SOCKSEND r3, r13, r10, r1

  ; Wait a moment for echo (100 frames = ~1.6 seconds)
  LDI r2, 100
wait_loop:
  FRAME
  SUB r2, r2, r3
  CMP r2, r3
  JNZ wait_loop
  CMP r2, r3
  JZ wait_done
  JMP wait_loop

wait_done:
  ; SOCKRECV fd_reg, buf_reg, max_len_reg, recv_reg
  LDI r13, RECV_BUF
  LDI r10, 200
  SOCKRECV r3, r13, r10, r1

  ; Draw "Received:" message
  LDI r13, 10
  LDI r10, 60
  LDI r3, msg_recv
  TEXT r13, r10, r3

  ; Draw the received message
  LDI r13, 60
  LDI r10, 60
  LDI r3, RECV_BUF
  TEXT r13, r10, r3

  ; Disconnect
  DISCONNECT r3

  ; Draw "Done!" message
  LDI r13, 10
  LDI r10, 80
  LDI r3, msg_done
  TEXT r13, r10, r3

  HALT

connect_fail:
  ; Draw error message
  LDI r13, 10
  LDI r10, 40
  LDI r3, msg_error
  TEXT r13, r10, r3
  HALT

title:
  TEXTI "=== TCP Networking Demo ==="

msg_connecting:
  TEXTI "Connecting to 127.0.0.1:8888..."

msg_connected:
  TEXTI "Connected! (fd stored in r3)"

msg_sent:
  TEXTI "Sent:"

msg_recv:
  TEXTI "Echo:"

msg_done:
  TEXTI "Done! Connection closed."

msg_error:
  TEXTI "ERROR: Could not connect."
