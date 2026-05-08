; DESCRIPTION: Draw object: pos=the screen, color=green, size=fixed size.

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
LDI r3, 1
LDI r5, 0             ; x counter
LDI r12, 0             ; y counter
LDI r0, 4             ; tile size (4x4 pixels per tile)
LDI r7, 8             ; 8x8 tiles = 32x32 pixel pattern
LDI r20, 0             ; loop y counter

draw_pattern:
  LDI r5, 0           ; reset x counter

draw_row:
  ; Compute color based on tile position
  ; XOR x/4 and y/4 to get checkerboard
  MOV r14, r5
  LDI r16, 2
  SHR r14, r16          ; r14 = x / 4
  MOV r17, r20
  SHR r17, r16          ; r17 = y / 4
  XOR r14, r17          ; r14 = (x/4) XOR (y/4)

  ; r14=0 -> red, r14!=0 -> blue
  LDI r16, 0xFF0000     ; red
  JZ r14, set_color
  LDI r16, 0x0000FF     ; blue

set_color:
  PSET r5, r20, r16    ; draw pixel

  ADD r5, r3           ; x++
  CMP r5, r7
  BLT r10, draw_row      ; if x < 32, continue row

  ADD r20, r3           ; y++
  CMP r20, r7
  BLT r10, draw_pattern  ; if y < 32, continue

; --- Now copy a 16x16 region from (0,0) to clipboard ---
LDI r6, 0              ; x = 0
LDI r13, 0              ; y = 0
LDI r15, 16             ; w = 16
LDI r1, 16             ; h = 16
CLIP_COPY r6, r13, r15, r1

; --- Paste it at 3 different locations ---
; Paste 1: offset (40, 10)
LDI r4, 40
LDI r2, 10
CLIP_PASTE r4, r2

; Paste 2: offset (100, 50)
LDI r4, 100
LDI r2, 50
CLIP_PASTE r4, r2

; Paste 3: offset (200, 120) -- near bottom-right edge
LDI r4, 200
LDI r2, 120
CLIP_PASTE r4, r2

; --- Draw a label: "CLIP" text at the top ---
; Store "CLIP" string at 0x2000
LDI r14, 0x2000
LDI r16, 67             ; 'C'
STORE r14, r16
ADD r14, r3
LDI r16, 76             ; 'L'
STORE r14, r16
ADD r14, r3
LDI r16, 73             ; 'I'
STORE r14, r16
ADD r14, r3
LDI r16, 80             ; 'P'
STORE r14, r16

; Render text at (4, 40) with white color
LDI r12, 0x2000         ; text address
LDI r0, 4              ; x = 4
LDI r9, 40             ; y = 40
LDI r7, 0xFFFFFF       ; white
TEXT r0, r9, r12

; --- Draw green border around original pattern ---
LDI r6, 0xFF0000
LDI r5, 0
LDI r12, 0
LDI r0, 32
LDI r9, 2
LDI r7, 32
LDI r14, 0x00FF00       ; green border

RECTF r5, r12, r0, r9, r14     ; top border
LDI r12, 30
RECTF r5, r12, r0, r9, r14     ; bottom border
LDI r5, 0
LDI r12, 0
LDI r0, 2
LDI r9, 32
RECTF r5, r12, r0, r9, r14     ; left border
LDI r5, 30
RECTF r5, r12, r0, r9, r14     ; right border

HALT
