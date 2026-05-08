; DESCRIPTION: Geometry OS program to draw a green object.

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
LDI r4, 1
LDI r3, 0             ; x counter
LDI r8, 0             ; y counter
LDI r6, 4             ; tile size (4x4 pixels per tile)
LDI r9, 8             ; 8x8 tiles = 32x32 pixel pattern
LDI r20, 0             ; loop y counter

draw_pattern:
  LDI r3, 0           ; reset x counter

draw_row:
  ; Compute color based on tile position
  ; XOR x/4 and y/4 to get checkerboard
  MOV r5, r3
  LDI r16, 2
  SHR r5, r16          ; r5 = x / 4
  MOV r17, r20
  SHR r17, r16          ; r17 = y / 4
  XOR r5, r17          ; r5 = (x/4) XOR (y/4)

  ; r5=0 -> red, r5!=0 -> blue
  LDI r16, 0xFF0000     ; red
  JZ r5, set_color
  LDI r16, 0x0000FF     ; blue

set_color:
  PSET r3, r20, r16    ; draw pixel

  ADD r3, r4           ; x++
  CMP r3, r9
  BLT r10, draw_row      ; if x < 32, continue row

  ADD r20, r4           ; y++
  CMP r20, r9
  BLT r10, draw_pattern  ; if y < 32, continue

; --- Now copy a 16x16 region from (0,0) to clipboard ---
LDI r7, 0              ; x = 0
LDI r2, 0              ; y = 0
LDI r11, 16             ; w = 16
LDI r14, 16             ; h = 16
CLIP_COPY r7, r2, r11, r14

; --- Paste it at 3 different locations ---
; Paste 1: offset (40, 10)
LDI r12, 40
LDI r13, 10
CLIP_PASTE r12, r13

; Paste 2: offset (100, 50)
LDI r12, 100
LDI r13, 50
CLIP_PASTE r12, r13

; Paste 3: offset (200, 120) -- near bottom-right edge
LDI r12, 200
LDI r13, 120
CLIP_PASTE r12, r13

; --- Draw a label: "CLIP" text at the top ---
; Store "CLIP" string at 0x2000
LDI r5, 0x2000
LDI r16, 67             ; 'C'
STORE r5, r16
ADD r5, r4
LDI r16, 76             ; 'L'
STORE r5, r16
ADD r5, r4
LDI r16, 73             ; 'I'
STORE r5, r16
ADD r5, r4
LDI r16, 80             ; 'P'
STORE r5, r16

; Render text at (4, 40) with white color
LDI r8, 0x2000         ; text address
LDI r6, 4              ; x = 4
LDI r0, 40             ; y = 40
LDI r9, 0xFFFFFF       ; white
TEXT r6, r0, r8

; --- Draw green border around original pattern ---
LDI r7, 0xFF0000
LDI r3, 0
LDI r8, 0
LDI r6, 32
LDI r0, 2
LDI r9, 32
LDI r5, 0x00FF00       ; green border

RECTF r3, r8, r6, r0, r5     ; top border
LDI r8, 30
RECTF r3, r8, r6, r0, r5     ; bottom border
LDI r3, 0
LDI r8, 0
LDI r6, 2
LDI r0, 32
RECTF r3, r8, r6, r0, r5     ; left border
LDI r3, 30
RECTF r3, r8, r6, r0, r5     ; right border

HALT
