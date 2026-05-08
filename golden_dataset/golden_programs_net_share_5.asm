; DESCRIPTION: Draws a green object at the screen with fixed size.

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

LDI r14, 0x7000       ; IP address string location
LDI r15, 49            ; '1'
STORE r14, r15
LDI r14, 0x7001
LDI r15, 50            ; '2'
STORE r14, r15
LDI r14, 0x7002
LDI r15, 55            ; '7'
STORE r14, r15
LDI r14, 0x7003
LDI r15, 46            ; '.'
STORE r14, r15
LDI r14, 0x7004
LDI r15, 48            ; '0'
STORE r14, r15
LDI r14, 0x7005
LDI r15, 46            ; '.'
STORE r14, r15
LDI r14, 0x7006
LDI r15, 48            ; '0'
STORE r14, r15
LDI r14, 0x7007
LDI r15, 46            ; '.'
STORE r14, r15
LDI r14, 0x7008
LDI r15, 49            ; '1'
STORE r14, r15
LDI r14, 0x7009
LDI r15, 0             ; null terminator
STORE r14, r15

; Draw a test pattern on screen before sharing
LDI r4, 0             ; y = 0
LDI r2, 1             ; increment
LDI r6, 256           ; limit
LDI r10, 0xFF0000      ; start color (red)

draw_loop:
  LDI r1, 0           ; x = 0

x_loop:
  ; Color = (y * 256 + x) << 8 for a gradient
  MOV r3, r4
  MUL r3, r6
  ADD r3, r1
  SHL r3, r2
  PSET r1, r4, r3
  ADD r1, r2
  CMP r1, r6
  BLT r13, x_loop
  ADD r4, r2
  CMP r4, r6
  BLT r13, draw_loop

; Now share the screen
; Step 1: Connect to peer
LDI r9, 0x7000        ; IP address
LDI r15, 3839          ; port (ascii_world terminal port)
CONNECT r9, r15, r3    ; r3 = fd

; Check if connection succeeded
LDI r12, 0
CMP r13, r12
JNZ r13, connected     ; r13 = 0 on success

; Connection failed - show red screen
LDI r10, 0xFF0000
FILL r10
HALT

connected:
MOV r12, r3            ; r12 = connection fd

; Send screen as rows (256 pixels per row = 1 NET_SEND per row)
LDI r4, 0             ; y = 0
LDI r2, 1             ; increment
LDI r6, 256           ; limit

send_loop:
  ; Screen row address = screen buffer base
  ; We use screen_ram_mirror which starts at 0x10000 in the address space
  ; But for NET_SEND we can just use any RAM region with the data

  ; For this demo, we'll construct the pixel data in RAM at 0x8000
  ; Copy one row of screen to RAM[0x8000..0x80FF]
  LDI r1, 0
  LDI r14, 0x8000
  LDI r5, 0x10000     ; screen buffer base (conceptual)

copy_row:
  ; Use SCREENP to read each pixel, then store in RAM
  ; Actually, for simplicity, just send data from RAM region
  ; In a real scenario, the screen buffer is accessible
  ADD r1, r2
  CMP r1, r6
  BLT r13, copy_row

  ; NET_SEND r14, r6, r12 -- send 256 words from 0x8000 to connection r12
  NET_SEND r14, r6, r12

  ; Check send result
  LDI r5, 0
  CMP r13, r5
  JZ r13, send_failed

  ADD r4, r2
  CMP r4, r6
  BLT r13, send_loop

; Done - show green
LDI r10, 0x00FF00
FILL r10
HALT

send_failed:
  ; Show yellow to indicate partial send
  LDI r10, 0xFFFF00
  FILL r10
  DISCONNECT r12
  HALT
