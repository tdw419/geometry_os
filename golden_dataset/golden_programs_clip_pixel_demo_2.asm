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
LDI r2, 1
LDI r15, 0             ; x counter
LDI r1, 0             ; y counter
LDI r9, 4             ; tile size (4x4 pixels per tile)
LDI r0, 8             ; 8x8 tiles = 32x32 pixel pattern
LDI r20, 0             ; loop y counter

draw_pattern:
  LDI r15, 0           ; reset x counter

draw_row:
  ; Compute color based on tile position
  ; XOR x/4 and y/4 to get checkerboard
  MOV r4, r15
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
  PSET r15, r20, r16    ; draw pixel

  ADD r15, r2           ; x++
  CMP r15, r0
  BLT r7, draw_row      ; if x < 32, continue row

  ADD r20, r2           ; y++
  CMP r20, r0
  BLT r7, draw_pattern  ; if y < 32, continue

; --- Now copy a 16x16 region from (0,0) to clipboard ---
LDI r11, 0              ; x = 0
LDI r13, 0              ; y = 0
LDI r8, 16             ; w = 16
LDI r6, 16             ; h = 16
CLIP_COPY r11, r13, r8, r6

; --- Paste it at 3 different locations ---
; Paste 1: offset (40, 10)
LDI r10, 40
LDI r5, 10
CLIP_PASTE r10, r5

; Paste 2: offset (100, 50)
LDI r10, 100
LDI r5, 50
CLIP_PASTE r10, r5

; Paste 3: offset (200, 120) -- near bottom-right edge
LDI r10, 200
LDI r5, 120
CLIP_PASTE r10, r5

; --- Draw a label: "CLIP" text at the top ---
; Store "CLIP" string at 0x2000
LDI r4, 0x2000
LDI r16, 67             ; 'C'
STORE r4, r16
ADD r4, r2
LDI r16, 76             ; 'L'
STORE r4, r16
ADD r4, r2
LDI r16, 73             ; 'I'
STORE r4, r16
ADD r4, r2
LDI r16, 80             ; 'P'
STORE r4, r16

; Render text at (4, 40) with white color
LDI r1, 0x2000         ; text address
LDI r9, 4              ; x = 4
LDI r12, 40             ; y = 40
LDI r0, 0xFFFFFF       ; white
TEXT r9, r12, r1

; --- Draw green border around original pattern ---
LDI r11, 0xFF0000
LDI r15, 0
LDI r1, 0
LDI r9, 32
LDI r12, 2
LDI r0, 32
LDI r4, 0x00FF00       ; green border

RECTF r15, r1, r9, r12, r4     ; top border
LDI r1, 30
RECTF r15, r1, r9, r12, r4     ; bottom border
LDI r15, 0
LDI r1, 0
LDI r9, 2
LDI r12, 32
RECTF r15, r1, r9, r12, r4     ; left border
LDI r15, 30
RECTF r15, r1, r9, r12, r4     ; right border

HALT
