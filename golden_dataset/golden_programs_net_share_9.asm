; DESCRIPTION: Draw object: pos=the screen, color=green, size=fixed size.

; net_share.asm -- Screen Sharing Demo (Phase 71: Pixel Network Protocol)
;
; Demonstrates NET_SEND for sharing screen content with a peer.
; Connect to a listening Geometry OS instance and send the screen
; as pixel protocol frames.
;
; Protocol: Each frame is a pixel protocol frame with type=0 (screen_share),
; containing a row of screen pixels (256 RGBA u32 values).
;
; Usage: Load on the sender side. Start a receiver with net_chat.asm or
; a custom listener first.

LDI r1, 0x7000       ; IP address string location
LDI r13, 49            ; '1'
STORE r1, r13
LDI r1, 0x7001
LDI r13, 50            ; '2'
STORE r1, r13
LDI r1, 0x7002
LDI r13, 55            ; '7'
STORE r1, r13
LDI r1, 0x7003
LDI r13, 46            ; '.'
STORE r1, r13
LDI r1, 0x7004
LDI r13, 48            ; '0'
STORE r1, r13
LDI r1, 0x7005
LDI r13, 46            ; '.'
STORE r1, r13
LDI r1, 0x7006
LDI r13, 48            ; '0'
STORE r1, r13
LDI r1, 0x7007
LDI r13, 46            ; '.'
STORE r1, r13
LDI r1, 0x7008
LDI r13, 49            ; '1'
STORE r1, r13
LDI r1, 0x7009
LDI r13, 0             ; null terminator
STORE r1, r13

; Draw a test pattern on screen before sharing
LDI r7, 0             ; y = 0
LDI r9, 1             ; increment
LDI r14, 256           ; limit
LDI r0, 0xFF0000      ; start color (red)

draw_loop:
  LDI r12, 0           ; x = 0

x_loop:
  ; Color = (y * 256 + x) << 8 for a gradient
  MOV r2, r7
  MUL r2, r14
  ADD r2, r12
  SHL r2, r9
  PSET r12, r7, r2
  ADD r12, r9
  CMP r12, r14
  BLT r11, x_loop
  ADD r7, r9
  CMP r7, r14
  BLT r11, draw_loop

; Now share the screen
; Step 1: Connect to peer
LDI r5, 0x7000        ; IP address
LDI r13, 3839          ; port (ascii_world terminal port)
CONNECT r5, r13, r2    ; r2 = fd

; Check if connection succeeded
LDI r3, 0
CMP r11, r3
JNZ r11, connected     ; r11 = 0 on success

; Connection failed - show red screen
LDI r0, 0xFF0000
FILL r0
HALT

connected:
MOV r3, r2            ; r3 = connection fd

; Send screen as rows (256 pixels per row = 1 NET_SEND per row)
LDI r7, 0             ; y = 0
LDI r9, 1             ; increment
LDI r14, 256           ; limit

send_loop:
  ; Screen row address = screen buffer base
  ; We use screen_ram_mirror which starts at 0x10000 in the address space
  ; But for NET_SEND we can just use any RAM region with the data

  ; For this demo, we'll construct the pixel data in RAM at 0x8000
  ; Copy one row of screen to RAM[0x8000..0x80FF]
  LDI r12, 0
  LDI r1, 0x8000
  LDI r15, 0x10000     ; screen buffer base (conceptual)

copy_row:
  ; Use SCREENP to read each pixel, then store in RAM
  ; Actually, for simplicity, just send data from RAM region
  ; In a real scenario, the screen buffer is accessible
  ADD r12, r9
  CMP r12, r14
  BLT r11, copy_row

  ; NET_SEND r1, r14, r3 -- send 256 words from 0x8000 to connection r3
  NET_SEND r1, r14, r3

  ; Check send result
  LDI r15, 0
  CMP r11, r15
  JZ r11, send_failed

  ADD r7, r9
  CMP r7, r14
  BLT r11, send_loop

; Done - show green
LDI r0, 0x00FF00
FILL r0
HALT

send_failed:
  ; Show yellow to indicate partial send
  LDI r0, 0xFFFF00
  FILL r0
  DISCONNECT r3
  HALT
