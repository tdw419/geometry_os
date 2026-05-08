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
LDI r9, 1
LDI r10, 0             ; x counter
LDI r8, 0             ; y counter
LDI r6, 4             ; tile size (4x4 pixels per tile)
LDI r12, 8             ; 8x8 tiles = 32x32 pixel pattern
LDI r20, 0             ; loop y counter

draw_pattern:
  LDI r10, 0           ; reset x counter

draw_row:
  ; Compute color based on tile position
  ; XOR x/4 and y/4 to get checkerboard
  MOV r2, r10
  LDI r16, 2
  SHR r2, r16          ; r2 = x / 4
  MOV r17, r20
  SHR r17, r16          ; r17 = y / 4
  XOR r2, r17          ; r2 = (x/4) XOR (y/4)

  ; r2=0 -> red, r2!=0 -> blue
  LDI r16, 0xFF0000     ; red
  JZ r2, set_color
  LDI r16, 0x0000FF     ; blue

set_color:
  PSET r10, r20, r16    ; draw pixel

  ADD r10, r9           ; x++
  CMP r10, r12
  BLT r11, draw_row      ; if x < 32, continue row

  ADD r20, r9           ; y++
  CMP r20, r12
  BLT r11, draw_pattern  ; if y < 32, continue

; --- Now copy a 16x16 region from (0,0) to clipboard ---
LDI r5, 0              ; x = 0
LDI r4, 0              ; y = 0
LDI r0, 16             ; w = 16
LDI r1, 16             ; h = 16
CLIP_COPY r5, r4, r0, r1

; --- Paste it at 3 different locations ---
; Paste 1: offset (40, 10)
LDI r3, 40
LDI r7, 10
CLIP_PASTE r3, r7

; Paste 2: offset (100, 50)
LDI r3, 100
LDI r7, 50
CLIP_PASTE r3, r7

; Paste 3: offset (200, 120) -- near bottom-right edge
LDI r3, 200
LDI r7, 120
CLIP_PASTE r3, r7

; --- Draw a label: "CLIP" text at the top ---
; Store "CLIP" string at 0x2000
LDI r2, 0x2000
LDI r16, 67             ; 'C'
STORE r2, r16
ADD r2, r9
LDI r16, 76             ; 'L'
STORE r2, r16
ADD r2, r9
LDI r16, 73             ; 'I'
STORE r2, r16
ADD r2, r9
LDI r16, 80             ; 'P'
STORE r2, r16

; Render text at (4, 40) with white color
LDI r8, 0x2000         ; text address
LDI r6, 4              ; x = 4
LDI r13, 40             ; y = 40
LDI r12, 0xFFFFFF       ; white
TEXT r6, r13, r8

; --- Draw green border around original pattern ---
LDI r5, 0xFF0000
LDI r10, 0
LDI r8, 0
LDI r6, 32
LDI r13, 2
LDI r12, 32
LDI r2, 0x00FF00       ; green border

RECTF r10, r8, r6, r13, r2     ; top border
LDI r8, 30
RECTF r10, r8, r6, r13, r2     ; bottom border
LDI r10, 0
LDI r8, 0
LDI r6, 2
LDI r13, 32
RECTF r10, r8, r6, r13, r2     ; left border
LDI r10, 30
RECTF r10, r8, r6, r13, r2     ; right border

HALT
