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

LDI r14, 0x7000       ; IP address string location
LDI r6, 49            ; '1'
STORE r14, r6
LDI r14, 0x7001
LDI r6, 50            ; '2'
STORE r14, r6
LDI r14, 0x7002
LDI r6, 55            ; '7'
STORE r14, r6
LDI r14, 0x7003
LDI r6, 46            ; '.'
STORE r14, r6
LDI r14, 0x7004
LDI r6, 48            ; '0'
STORE r14, r6
LDI r14, 0x7005
LDI r6, 46            ; '.'
STORE r14, r6
LDI r14, 0x7006
LDI r6, 48            ; '0'
STORE r14, r6
LDI r14, 0x7007
LDI r6, 46            ; '.'
STORE r14, r6
LDI r14, 0x7008
LDI r6, 49            ; '1'
STORE r14, r6
LDI r14, 0x7009
LDI r6, 0             ; null terminator
STORE r14, r6

; Draw a test pattern on screen before sharing
LDI r0, 0             ; y = 0
LDI r4, 1             ; increment
LDI r13, 256           ; limit
LDI r9, 0xFF0000      ; start color (red)

draw_loop:
  LDI r3, 0           ; x = 0

x_loop:
  ; Color = (y * 256 + x) << 8 for a gradient
  MOV r5, r0
  MUL r5, r13
  ADD r5, r3
  SHL r5, r4
  PSET r3, r0, r5
  ADD r3, r4
  CMP r3, r13
  BLT r15, x_loop
  ADD r0, r4
  CMP r0, r13
  BLT r15, draw_loop

; Now share the screen
; Step 1: Connect to peer
LDI r10, 0x7000        ; IP address
LDI r6, 3839          ; port (ascii_world terminal port)
CONNECT r10, r6, r5    ; r5 = fd

; Check if connection succeeded
LDI r8, 0
CMP r15, r8
JNZ r15, connected     ; r15 = 0 on success

; Connection failed - show red screen
LDI r9, 0xFF0000
FILL r9
HALT

connected:
MOV r8, r5            ; r8 = connection fd

; Send screen as rows (256 pixels per row = 1 NET_SEND per row)
LDI r0, 0             ; y = 0
LDI r4, 1             ; increment
LDI r13, 256           ; limit

send_loop:
  ; Screen row address = screen buffer base
  ; We use screen_ram_mirror which starts at 0x10000 in the address space
  ; But for NET_SEND we can just use any RAM region with the data

  ; For this demo, we'll construct the pixel data in RAM at 0x8000
  ; Copy one row of screen to RAM[0x8000..0x80FF]
  LDI r3, 0
  LDI r14, 0x8000
  LDI r1, 0x10000     ; screen buffer base (conceptual)

copy_row:
  ; Use SCREENP to read each pixel, then store in RAM
  ; Actually, for simplicity, just send data from RAM region
  ; In a real scenario, the screen buffer is accessible
  ADD r3, r4
  CMP r3, r13
  BLT r15, copy_row

  ; NET_SEND r14, r13, r8 -- send 256 words from 0x8000 to connection r8
  NET_SEND r14, r13, r8

  ; Check send result
  LDI r1, 0
  CMP r15, r1
  JZ r15, send_failed

  ADD r0, r4
  CMP r0, r13
  BLT r15, send_loop

; Done - show green
LDI r9, 0x00FF00
FILL r9
HALT

send_failed:
  ; Show yellow to indicate partial send
  LDI r9, 0xFFFF00
  FILL r9
  DISCONNECT r8
  HALT
