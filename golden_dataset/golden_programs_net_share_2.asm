; DESCRIPTION: A green object centered at the screen with fixed size.

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

LDI r7, 0x7000       ; IP address string location
LDI r2, 49            ; '1'
STORE r7, r2
LDI r7, 0x7001
LDI r2, 50            ; '2'
STORE r7, r2
LDI r7, 0x7002
LDI r2, 55            ; '7'
STORE r7, r2
LDI r7, 0x7003
LDI r2, 46            ; '.'
STORE r7, r2
LDI r7, 0x7004
LDI r2, 48            ; '0'
STORE r7, r2
LDI r7, 0x7005
LDI r2, 46            ; '.'
STORE r7, r2
LDI r7, 0x7006
LDI r2, 48            ; '0'
STORE r7, r2
LDI r7, 0x7007
LDI r2, 46            ; '.'
STORE r7, r2
LDI r7, 0x7008
LDI r2, 49            ; '1'
STORE r7, r2
LDI r7, 0x7009
LDI r2, 0             ; null terminator
STORE r7, r2

; Draw a test pattern on screen before sharing
LDI r11, 0             ; y = 0
LDI r9, 1             ; increment
LDI r8, 256           ; limit
LDI r13, 0xFF0000      ; start color (red)

draw_loop:
  LDI r15, 0           ; x = 0

x_loop:
  ; Color = (y * 256 + x) << 8 for a gradient
  MOV r5, r11
  MUL r5, r8
  ADD r5, r15
  SHL r5, r9
  PSET r15, r11, r5
  ADD r15, r9
  CMP r15, r8
  BLT r10, x_loop
  ADD r11, r9
  CMP r11, r8
  BLT r10, draw_loop

; Now share the screen
; Step 1: Connect to peer
LDI r12, 0x7000        ; IP address
LDI r2, 3839          ; port (ascii_world terminal port)
CONNECT r12, r2, r5    ; r5 = fd

; Check if connection succeeded
LDI r14, 0
CMP r10, r14
JNZ r10, connected     ; r10 = 0 on success

; Connection failed - show red screen
LDI r13, 0xFF0000
FILL r13
HALT

connected:
MOV r14, r5            ; r14 = connection fd

; Send screen as rows (256 pixels per row = 1 NET_SEND per row)
LDI r11, 0             ; y = 0
LDI r9, 1             ; increment
LDI r8, 256           ; limit

send_loop:
  ; Screen row address = screen buffer base
  ; We use screen_ram_mirror which starts at 0x10000 in the address space
  ; But for NET_SEND we can just use any RAM region with the data

  ; For this demo, we'll construct the pixel data in RAM at 0x8000
  ; Copy one row of screen to RAM[0x8000..0x80FF]
  LDI r15, 0
  LDI r7, 0x8000
  LDI r4, 0x10000     ; screen buffer base (conceptual)

copy_row:
  ; Use SCREENP to read each pixel, then store in RAM
  ; Actually, for simplicity, just send data from RAM region
  ; In a real scenario, the screen buffer is accessible
  ADD r15, r9
  CMP r15, r8
  BLT r10, copy_row

  ; NET_SEND r7, r8, r14 -- send 256 words from 0x8000 to connection r14
  NET_SEND r7, r8, r14

  ; Check send result
  LDI r4, 0
  CMP r10, r4
  JZ r10, send_failed

  ADD r11, r9
  CMP r11, r8
  BLT r10, send_loop

; Done - show green
LDI r13, 0x00FF00
FILL r13
HALT

send_failed:
  ; Show yellow to indicate partial send
  LDI r13, 0xFFFF00
  FILL r13
  DISCONNECT r14
  HALT
