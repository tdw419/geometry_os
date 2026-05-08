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
LDI r11, 1
LDI r2, 0             ; x counter
LDI r12, 0             ; y counter
LDI r10, 4             ; tile size (4x4 pixels per tile)
LDI r15, 8             ; 8x8 tiles = 32x32 pixel pattern
LDI r20, 0             ; loop y counter

draw_pattern:
  LDI r2, 0           ; reset x counter

draw_row:
  ; Compute color based on tile position
  ; XOR x/4 and y/4 to get checkerboard
  MOV r1, r2
  LDI r16, 2
  SHR r1, r16          ; r1 = x / 4
  MOV r17, r20
  SHR r17, r16          ; r17 = y / 4
  XOR r1, r17          ; r1 = (x/4) XOR (y/4)

  ; r1=0 -> red, r1!=0 -> blue
  LDI r16, 0xFF0000     ; red
  JZ r1, set_color
  LDI r16, 0x0000FF     ; blue

set_color:
  PSET r2, r20, r16    ; draw pixel

  ADD r2, r11           ; x++
  CMP r2, r15
  BLT r8, draw_row      ; if x < 32, continue row

  ADD r20, r11           ; y++
  CMP r20, r15
  BLT r8, draw_pattern  ; if y < 32, continue

; --- Now copy a 16x16 region from (0,0) to clipboard ---
LDI r14, 0              ; x = 0
LDI r3, 0              ; y = 0
LDI r0, 16             ; w = 16
LDI r9, 16             ; h = 16
CLIP_COPY r14, r3, r0, r9

; --- Paste it at 3 different locations ---
; Paste 1: offset (40, 10)
LDI r6, 40
LDI r4, 10
CLIP_PASTE r6, r4

; Paste 2: offset (100, 50)
LDI r6, 100
LDI r4, 50
CLIP_PASTE r6, r4

; Paste 3: offset (200, 120) -- near bottom-right edge
LDI r6, 200
LDI r4, 120
CLIP_PASTE r6, r4

; --- Draw a label: "CLIP" text at the top ---
; Store "CLIP" string at 0x2000
LDI r1, 0x2000
LDI r16, 67             ; 'C'
STORE r1, r16
ADD r1, r11
LDI r16, 76             ; 'L'
STORE r1, r16
ADD r1, r11
LDI r16, 73             ; 'I'
STORE r1, r16
ADD r1, r11
LDI r16, 80             ; 'P'
STORE r1, r16

; Render text at (4, 40) with white color
LDI r12, 0x2000         ; text address
LDI r10, 4              ; x = 4
LDI r5, 40             ; y = 40
LDI r15, 0xFFFFFF       ; white
TEXT r10, r5, r12

; --- Draw green border around original pattern ---
LDI r14, 0xFF0000
LDI r2, 0
LDI r12, 0
LDI r10, 32
LDI r5, 2
LDI r15, 32
LDI r1, 0x00FF00       ; green border

RECTF r2, r12, r10, r5, r1     ; top border
LDI r12, 30
RECTF r2, r12, r10, r5, r1     ; bottom border
LDI r2, 0
LDI r12, 0
LDI r10, 2
LDI r5, 32
RECTF r2, r12, r10, r5, r1     ; left border
LDI r2, 30
RECTF r2, r12, r10, r5, r1     ; right border

HALT
