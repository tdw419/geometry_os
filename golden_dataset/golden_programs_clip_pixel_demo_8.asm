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
LDI r0, 1
LDI r3, 0             ; x counter
LDI r5, 0             ; y counter
LDI r8, 4             ; tile size (4x4 pixels per tile)
LDI r6, 8             ; 8x8 tiles = 32x32 pixel pattern
LDI r20, 0             ; loop y counter

draw_pattern:
  LDI r3, 0           ; reset x counter

draw_row:
  ; Compute color based on tile position
  ; XOR x/4 and y/4 to get checkerboard
  MOV r15, r3
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
  PSET r3, r20, r16    ; draw pixel

  ADD r3, r0           ; x++
  CMP r3, r6
  BLT r4, draw_row      ; if x < 32, continue row

  ADD r20, r0           ; y++
  CMP r20, r6
  BLT r4, draw_pattern  ; if y < 32, continue

; --- Now copy a 16x16 region from (0,0) to clipboard ---
LDI r13, 0              ; x = 0
LDI r1, 0              ; y = 0
LDI r14, 16             ; w = 16
LDI r10, 16             ; h = 16
CLIP_COPY r13, r1, r14, r10

; --- Paste it at 3 different locations ---
; Paste 1: offset (40, 10)
LDI r12, 40
LDI r2, 10
CLIP_PASTE r12, r2

; Paste 2: offset (100, 50)
LDI r12, 100
LDI r2, 50
CLIP_PASTE r12, r2

; Paste 3: offset (200, 120) -- near bottom-right edge
LDI r12, 200
LDI r2, 120
CLIP_PASTE r12, r2

; --- Draw a label: "CLIP" text at the top ---
; Store "CLIP" string at 0x2000
LDI r15, 0x2000
LDI r16, 67             ; 'C'
STORE r15, r16
ADD r15, r0
LDI r16, 76             ; 'L'
STORE r15, r16
ADD r15, r0
LDI r16, 73             ; 'I'
STORE r15, r16
ADD r15, r0
LDI r16, 80             ; 'P'
STORE r15, r16

; Render text at (4, 40) with white color
LDI r5, 0x2000         ; text address
LDI r8, 4              ; x = 4
LDI r9, 40             ; y = 40
LDI r6, 0xFFFFFF       ; white
TEXT r8, r9, r5

; --- Draw green border around original pattern ---
LDI r13, 0xFF0000
LDI r3, 0
LDI r5, 0
LDI r8, 32
LDI r9, 2
LDI r6, 32
LDI r15, 0x00FF00       ; green border

RECTF r3, r5, r8, r9, r15     ; top border
LDI r5, 30
RECTF r3, r5, r8, r9, r15     ; bottom border
LDI r3, 0
LDI r5, 0
LDI r8, 2
LDI r9, 32
RECTF r3, r5, r8, r9, r15     ; left border
LDI r3, 30
RECTF r3, r5, r8, r9, r15     ; right border

HALT
