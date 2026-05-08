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
LDI r15, 1
LDI r11, 0             ; x counter
LDI r2, 0             ; y counter
LDI r14, 4             ; tile size (4x4 pixels per tile)
LDI r12, 8             ; 8x8 tiles = 32x32 pixel pattern
LDI r20, 0             ; loop y counter

draw_pattern:
  LDI r11, 0           ; reset x counter

draw_row:
  ; Compute color based on tile position
  ; XOR x/4 and y/4 to get checkerboard
  MOV r8, r11
  LDI r16, 2
  SHR r8, r16          ; r8 = x / 4
  MOV r17, r20
  SHR r17, r16          ; r17 = y / 4
  XOR r8, r17          ; r8 = (x/4) XOR (y/4)

  ; r8=0 -> red, r8!=0 -> blue
  LDI r16, 0xFF0000     ; red
  JZ r8, set_color
  LDI r16, 0x0000FF     ; blue

set_color:
  PSET r11, r20, r16    ; draw pixel

  ADD r11, r15           ; x++
  CMP r11, r12
  BLT r3, draw_row      ; if x < 32, continue row

  ADD r20, r15           ; y++
  CMP r20, r12
  BLT r3, draw_pattern  ; if y < 32, continue

; --- Now copy a 16x16 region from (0,0) to clipboard ---
LDI r6, 0              ; x = 0
LDI r5, 0              ; y = 0
LDI r9, 16             ; w = 16
LDI r10, 16             ; h = 16
CLIP_COPY r6, r5, r9, r10

; --- Paste it at 3 different locations ---
; Paste 1: offset (40, 10)
LDI r1, 40
LDI r0, 10
CLIP_PASTE r1, r0

; Paste 2: offset (100, 50)
LDI r1, 100
LDI r0, 50
CLIP_PASTE r1, r0

; Paste 3: offset (200, 120) -- near bottom-right edge
LDI r1, 200
LDI r0, 120
CLIP_PASTE r1, r0

; --- Draw a label: "CLIP" text at the top ---
; Store "CLIP" string at 0x2000
LDI r8, 0x2000
LDI r16, 67             ; 'C'
STORE r8, r16
ADD r8, r15
LDI r16, 76             ; 'L'
STORE r8, r16
ADD r8, r15
LDI r16, 73             ; 'I'
STORE r8, r16
ADD r8, r15
LDI r16, 80             ; 'P'
STORE r8, r16

; Render text at (4, 40) with white color
LDI r2, 0x2000         ; text address
LDI r14, 4              ; x = 4
LDI r7, 40             ; y = 40
LDI r12, 0xFFFFFF       ; white
TEXT r14, r7, r2

; --- Draw green border around original pattern ---
LDI r6, 0xFF0000
LDI r11, 0
LDI r2, 0
LDI r14, 32
LDI r7, 2
LDI r12, 32
LDI r8, 0x00FF00       ; green border

RECTF r11, r2, r14, r7, r8     ; top border
LDI r2, 30
RECTF r11, r2, r14, r7, r8     ; bottom border
LDI r11, 0
LDI r2, 0
LDI r14, 2
LDI r7, 32
RECTF r11, r2, r14, r7, r8     ; left border
LDI r11, 30
RECTF r11, r2, r14, r7, r8     ; right border

HALT
