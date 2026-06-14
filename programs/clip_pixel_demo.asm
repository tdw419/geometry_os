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
LDI r7, 1
LDI r10, 0             ; x counter
LDI r11, 0             ; y counter
LDI r12, 4             ; tile size (4x4 pixels per tile)
LDI r14, 8             ; 8x8 tiles = 32x32 pixel pattern
LDI r20, 0             ; loop y counter

draw_pattern:
  LDI r10, 0           ; reset x counter

draw_row:
  ; Compute color based on tile position
  ; XOR x/4 and y/4 to get checkerboard
  MOV r15, r10
  LDI r16, 2
  SHR r15, r16          ; r15 = x / 4
  MOV r17, r20
  SHR r17, r16          ; r17 = y / 4
  XOR r15, r17          ; r15 = (x/4) XOR (y/4)

  ; r15=0 -> red, r15!=0 -> blue
  LDI r16, 0xFF0000     ; red
  JZ r15, set_color
  LDI r16, 0x0000FF     ; blue

set_color:
  PSET r10, r20, r16    ; draw pixel

  ADD r10, r7           ; x++
  CMP r10, r14
  BLT r0, draw_row      ; if x < 32, continue row

  ADD r20, r7           ; y++
  CMP r20, r14
  BLT r0, draw_pattern  ; if y < 32, continue

; --- Now copy a 16x16 region from (0,0) to clipboard ---
LDI r1, 0              ; x = 0
LDI r2, 0              ; y = 0
LDI r3, 16             ; w = 16
LDI r4, 16             ; h = 16
CLIP_COPY r1, r2, r3, r4

; --- Paste it at 3 different locations ---
; Paste 1: offset (40, 10)
LDI r5, 40
LDI r6, 10
CLIP_PASTE r5, r6

; Paste 2: offset (100, 50)
LDI r5, 100
LDI r6, 50
CLIP_PASTE r5, r6

; Paste 3: offset (200, 120) -- near bottom-right edge
LDI r5, 200
LDI r6, 120
CLIP_PASTE r5, r6

; --- Draw a label: "CLIP" text at the top ---
; Store "CLIP" string at 0x2000
LDI r15, 0x2000
LDI r16, 67             ; 'C'
STORE r15, r16
ADD r15, r7
LDI r16, 76             ; 'L'
STORE r15, r16
ADD r15, r7
LDI r16, 73             ; 'I'
STORE r15, r16
ADD r15, r7
LDI r16, 80             ; 'P'
STORE r15, r16

; Render text at (4, 40) with white color
LDI r11, 0x2000         ; text address
LDI r12, 4              ; x = 4
LDI r13, 40             ; y = 40
LDI r14, 0xFFFFFF       ; white
TEXT r12, r13, r11

; --- Draw green border around original pattern ---
LDI r1, 0xFF0000
LDI r10, 0
LDI r11, 0
LDI r12, 32
LDI r13, 2
LDI r14, 32
LDI r15, 0x00FF00       ; green border

RECTF r10, r11, r12, r13, r15     ; top border
LDI r11, 30
RECTF r10, r11, r12, r13, r15     ; bottom border
LDI r10, 0
LDI r11, 0
LDI r12, 2
LDI r13, 32
RECTF r10, r11, r12, r13, r15     ; left border
LDI r10, 30
RECTF r10, r11, r12, r13, r15     ; right border

HALT
