; DESCRIPTION: A green object centered at the screen with fixed size.

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
LDI r15, 1
LDI r3, 0             ; x counter
LDI r14, 0             ; y counter
LDI r1, 4             ; tile size (4x4 pixels per tile)
LDI r13, 8             ; 8x8 tiles = 32x32 pixel pattern
LDI r20, 0             ; loop y counter

draw_pattern:
  LDI r3, 0           ; reset x counter

draw_row:
  ; Compute color based on tile position
  ; XOR x/4 and y/4 to get checkerboard
  MOV r4, r3
  LDI r16, 2
  SHR r4, r16          ; r4 = x / 4
  MOV r17, r20
  SHR r17, r16          ; r17 = y / 4
  XOR r4, r17          ; r4 = (x/4) XOR (y/4)

  ; r4=0 -> red, r4!=0 -> blue
  LDI r16, 0xFF0000     ; red
  JZ r4, set_color
  LDI r16, 0x0000FF     ; blue

set_color:
  PSET r3, r20, r16    ; draw pixel

  ADD r3, r15           ; x++
  CMP r3, r13
  BLT r8, draw_row      ; if x < 32, continue row

  ADD r20, r15           ; y++
  CMP r20, r13
  BLT r8, draw_pattern  ; if y < 32, continue

; --- Now copy a 16x16 region from (0,0) to clipboard ---
LDI r5, 0              ; x = 0
LDI r11, 0              ; y = 0
LDI r9, 16             ; w = 16
LDI r6, 16             ; h = 16
CLIP_COPY r5, r11, r9, r6

; --- Paste it at 3 different locations ---
; Paste 1: offset (40, 10)
LDI r2, 40
LDI r0, 10
CLIP_PASTE r2, r0

; Paste 2: offset (100, 50)
LDI r2, 100
LDI r0, 50
CLIP_PASTE r2, r0

; Paste 3: offset (200, 120) -- near bottom-right edge
LDI r2, 200
LDI r0, 120
CLIP_PASTE r2, r0

; --- Draw a label: "CLIP" text at the top ---
; Store "CLIP" string at 0x2000
LDI r4, 0x2000
LDI r16, 67             ; 'C'
STORE r4, r16
ADD r4, r15
LDI r16, 76             ; 'L'
STORE r4, r16
ADD r4, r15
LDI r16, 73             ; 'I'
STORE r4, r16
ADD r4, r15
LDI r16, 80             ; 'P'
STORE r4, r16

; Render text at (4, 40) with white color
LDI r14, 0x2000         ; text address
LDI r1, 4              ; x = 4
LDI r12, 40             ; y = 40
LDI r13, 0xFFFFFF       ; white
TEXT r1, r12, r14

; --- Draw green border around original pattern ---
LDI r5, 0xFF0000
LDI r3, 0
LDI r14, 0
LDI r1, 32
LDI r12, 2
LDI r13, 32
LDI r4, 0x00FF00       ; green border

RECTF r3, r14, r1, r12, r4     ; top border
LDI r14, 30
RECTF r3, r14, r1, r12, r4     ; bottom border
LDI r3, 0
LDI r14, 0
LDI r1, 2
LDI r12, 32
RECTF r3, r14, r1, r12, r4     ; left border
LDI r3, 30
RECTF r3, r14, r1, r12, r4     ; right border

HALT
