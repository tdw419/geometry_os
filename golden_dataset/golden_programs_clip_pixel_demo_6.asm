; DESCRIPTION: This GeOS assembly code draws a colorful 4x4 checkerboard pattern in the top-left corner of the screen. It then copies a 16x16 region from the top-left to the clipboard and pastes it at three different locations on the screen, demonstrating pixel sharing. Additionally, it renders the text "CLIP" at the top and draws a green border around the original pattern.

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
LDI r12, 1
LDI r9, 0             ; x counter
LDI r6, 0             ; y counter
LDI r15, 4             ; tile size (4x4 pixels per tile)
LDI r13, 8             ; 8x8 tiles = 32x32 pixel pattern
LDI r20, 0             ; loop y counter

draw_pattern:
  LDI r9, 0           ; reset x counter

draw_row:
  ; Compute color based on tile position
  ; XOR x/4 and y/4 to get checkerboard
  MOV r1, r9
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
  PSET r9, r20, r16    ; draw pixel

  ADD r9, r12           ; x++
  CMP r9, r13
  BLT r8, draw_row      ; if x < 32, continue row

  ADD r20, r12           ; y++
  CMP r20, r13
  BLT r8, draw_pattern  ; if y < 32, continue

; --- Now copy a 16x16 region from (0,0) to clipboard ---
LDI r7, 0              ; x = 0
LDI r5, 0              ; y = 0
LDI r11, 16             ; w = 16
LDI r10, 16             ; h = 16
CLIP_COPY r7, r5, r11, r10

; --- Paste it at 3 different locations ---
; Paste 1: offset (40, 10)
LDI r0, 40
LDI r2, 10
CLIP_PASTE r0, r2

; Paste 2: offset (100, 50)
LDI r0, 100
LDI r2, 50
CLIP_PASTE r0, r2

; Paste 3: offset (200, 120) -- near bottom-right edge
LDI r0, 200
LDI r2, 120
CLIP_PASTE r0, r2

; --- Draw a label: "CLIP" text at the top ---
; Store "CLIP" string at 0x2000
LDI r1, 0x2000
LDI r16, 67             ; 'C'
STORE r1, r16
ADD r1, r12
LDI r16, 76             ; 'L'
STORE r1, r16
ADD r1, r12
LDI r16, 73             ; 'I'
STORE r1, r16
ADD r1, r12
LDI r16, 80             ; 'P'
STORE r1, r16

; Render text at (4, 40) with white color
LDI r6, 0x2000         ; text address
LDI r15, 4              ; x = 4
LDI r4, 40             ; y = 40
LDI r13, 0xFFFFFF       ; white
TEXT r15, r4, r6

; --- Draw green border around original pattern ---
LDI r7, 0xFF0000
LDI r9, 0
LDI r6, 0
LDI r15, 32
LDI r4, 2
LDI r13, 32
LDI r1, 0x00FF00       ; green border

RECTF r9, r6, r15, r4, r1     ; top border
LDI r6, 30
RECTF r9, r6, r15, r4, r1     ; bottom border
LDI r9, 0
LDI r6, 0
LDI r15, 2
LDI r4, 32
RECTF r9, r6, r15, r4, r1     ; left border
LDI r9, 30
RECTF r9, r6, r15, r4, r1     ; right border

HALT
