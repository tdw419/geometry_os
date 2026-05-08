; DESCRIPTION: Draws a green object at the screen with fixed size.

; clip_pixel_demo.asm -- Phase 204: CLIP_COPY/CLIP_PASTE opcode demo
;
; Draws a colored pattern, copies a 16x16 region to the clipboard,
; then pastes it at 3 different locations to demonstrate pixel sharing.
;
; CLIP_COPY x_reg, y_reg, w_reg, h_reg  (0xD7)
;   Copies screen[x..x+w, y..y+h] into clipboard buffer
;   Buffer format: [width, height, pixel0, pixel1, ...]
;
; CLIP_PASTE x_reg, y_reg  (0xD8)
;   Pastes clipboard contents at (x, y) on screen

; --- Draw a colorful 4x4 checkerboard pattern in the top-left ---
LDI r2, 1
LDI r13, 0             ; x counter
LDI r15, 0             ; y counter
LDI r7, 4             ; tile size (4x4 pixels per tile)
LDI r12, 8             ; 8x8 tiles = 32x32 pixel pattern
LDI r20, 0             ; loop y counter

draw_pattern:
  LDI r13, 0           ; reset x counter

draw_row:
  ; Compute color based on tile position
  ; XOR x/4 and y/4 to get checkerboard
  MOV r9, r13
  LDI r16, 2
  SHR r9, r16          ; r9 = x / 4
  MOV r17, r20
  SHR r17, r16          ; r17 = y / 4
  XOR r9, r17          ; r9 = (x/4) XOR (y/4)

  ; r9=0 -> red, r9!=0 -> blue
  LDI r16, 0xFF0000     ; red
  JZ r9, set_color
  LDI r16, 0x0000FF     ; blue

set_color:
  PSET r13, r20, r16    ; draw pixel

  ADD r13, r2           ; x++
  CMP r13, r12
  BLT r4, draw_row      ; if x < 32, continue row

  ADD r20, r2           ; y++
  CMP r20, r12
  BLT r4, draw_pattern  ; if y < 32, continue

; --- Now copy a 16x16 region from (0,0) to clipboard ---
LDI r6, 0              ; x = 0
LDI r1, 0              ; y = 0
LDI r3, 16             ; w = 16
LDI r10, 16             ; h = 16
CLIP_COPY r6, r1, r3, r10

; --- Paste it at 3 different locations ---
; Paste 1: offset (40, 10)
LDI r5, 40
LDI r8, 10
CLIP_PASTE r5, r8

; Paste 2: offset (100, 50)
LDI r5, 100
LDI r8, 50
CLIP_PASTE r5, r8

; Paste 3: offset (200, 120) -- near bottom-right edge
LDI r5, 200
LDI r8, 120
CLIP_PASTE r5, r8

; --- Draw a label: "CLIP" text at the top ---
; Store "CLIP" string at 0x2000
LDI r9, 0x2000
LDI r16, 67             ; 'C'
STORE r9, r16
ADD r9, r2
LDI r16, 76             ; 'L'
STORE r9, r16
ADD r9, r2
LDI r16, 73             ; 'I'
STORE r9, r16
ADD r9, r2
LDI r16, 80             ; 'P'
STORE r9, r16

; Render text at (4, 40) with white color
LDI r15, 0x2000         ; text address
LDI r7, 4              ; x = 4
LDI r0, 40             ; y = 40
LDI r12, 0xFFFFFF       ; white
TEXT r7, r0, r15

; --- Draw green border around original pattern ---
LDI r6, 0xFF0000
LDI r13, 0
LDI r15, 0
LDI r7, 32
LDI r0, 2
LDI r12, 32
LDI r9, 0x00FF00       ; green border

RECTF r13, r15, r7, r0, r9     ; top border
LDI r15, 30
RECTF r13, r15, r7, r0, r9     ; bottom border
LDI r13, 0
LDI r15, 0
LDI r7, 2
LDI r0, 32
RECTF r13, r15, r7, r0, r9     ; left border
LDI r13, 30
RECTF r13, r15, r7, r0, r9     ; right border

HALT
