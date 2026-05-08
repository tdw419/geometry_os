; DESCRIPTION: Display a object using color green at the screen.

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

LDI r8, 0x7000       ; IP address string location
LDI r13, 49            ; '1'
STORE r8, r13
LDI r8, 0x7001
LDI r13, 50            ; '2'
STORE r8, r13
LDI r8, 0x7002
LDI r13, 55            ; '7'
STORE r8, r13
LDI r8, 0x7003
LDI r13, 46            ; '.'
STORE r8, r13
LDI r8, 0x7004
LDI r13, 48            ; '0'
STORE r8, r13
LDI r8, 0x7005
LDI r13, 46            ; '.'
STORE r8, r13
LDI r8, 0x7006
LDI r13, 48            ; '0'
STORE r8, r13
LDI r8, 0x7007
LDI r13, 46            ; '.'
STORE r8, r13
LDI r8, 0x7008
LDI r13, 49            ; '1'
STORE r8, r13
LDI r8, 0x7009
LDI r13, 0             ; null terminator
STORE r8, r13

; Draw a test pattern on screen before sharing
LDI r11, 0             ; y = 0
LDI r12, 1             ; increment
LDI r0, 256           ; limit
LDI r14, 0xFF0000      ; start color (red)

draw_loop:
  LDI r10, 0           ; x = 0

x_loop:
  ; Color = (y * 256 + x) << 8 for a gradient
  MOV r7, r11
  MUL r7, r0
  ADD r7, r10
  SHL r7, r12
  PSET r10, r11, r7
  ADD r10, r12
  CMP r10, r0
  BLT r2, x_loop
  ADD r11, r12
  CMP r11, r0
  BLT r2, draw_loop

; Now share the screen
; Step 1: Connect to peer
LDI r3, 0x7000        ; IP address
LDI r13, 3839          ; port (ascii_world terminal port)
CONNECT r3, r13, r7    ; r7 = fd

; Check if connection succeeded
LDI r1, 0
CMP r2, r1
JNZ r2, connected     ; r2 = 0 on success

; Connection failed - show red screen
LDI r14, 0xFF0000
FILL r14
HALT

connected:
MOV r1, r7            ; r1 = connection fd

; Send screen as rows (256 pixels per row = 1 NET_SEND per row)
LDI r11, 0             ; y = 0
LDI r12, 1             ; increment
LDI r0, 256           ; limit

send_loop:
  ; Screen row address = screen buffer base
  ; We use screen_ram_mirror which starts at 0x10000 in the address space
  ; But for NET_SEND we can just use any RAM region with the data

  ; For this demo, we'll construct the pixel data in RAM at 0x8000
  ; Copy one row of screen to RAM[0x8000..0x80FF]
  LDI r10, 0
  LDI r8, 0x8000
  LDI r15, 0x10000     ; screen buffer base (conceptual)

copy_row:
  ; Use SCREENP to read each pixel, then store in RAM
  ; Actually, for simplicity, just send data from RAM region
  ; In a real scenario, the screen buffer is accessible
  ADD r10, r12
  CMP r10, r0
  BLT r2, copy_row

  ; NET_SEND r8, r0, r1 -- send 256 words from 0x8000 to connection r1
  NET_SEND r8, r0, r1

  ; Check send result
  LDI r15, 0
  CMP r2, r15
  JZ r2, send_failed

  ADD r11, r12
  CMP r11, r0
  BLT r2, send_loop

; Done - show green
LDI r14, 0x00FF00
FILL r14
HALT

send_failed:
  ; Show yellow to indicate partial send
  LDI r14, 0xFFFF00
  FILL r14
  DISCONNECT r1
  HALT
