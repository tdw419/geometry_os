; DESCRIPTION: Render a red object at the screen.

; clipboard_pixel_demo.asm -- Phase 204: Pixel Clipboard Demo
;
; Draws a colored pattern, copies it to the clipboard with CLIP_COPY,
; then pastes it to new locations with CLIP_PASTE. Demonstrates
; cross-region pixel sharing between programs.
;
; Visual: Red/blue checkerboard at (10,10), copied and pasted at (130,130).
; Green gradient strip at (10,50), copied and pasted at (10,70) and (10,90).
; Checkerboard also pasted again at (50,130).

; --- Draw a 4x4 checkerboard at (10, 10) ---
LDI r3, 1              ; constant 1 for increments
LDI r5, 0xFF0000       ; red
LDI r7, 0x0000FF       ; blue
LDI r2, 10            ; x
LDI r13, 10            ; y
LDI r0, 0             ; col
LDI r11, 0             ; row
LDI r12, 4             ; width
LDI r8, 4             ; height

draw_checker:
  ; Determine color: if (row + col) is odd, use blue, else red
  MOV r20, r0
  ADD r20, r11
  LDI r21, 1
  AND r20, r21
  JZ r20, use_red
  PSET r2, r13, r7
  JMP next_cell
use_red:
  PSET r2, r13, r5
next_cell:
  ADD r2, r3          ; x++
  ADD r0, r3          ; col++
  LDI r20, 4
  CMP r0, r20
  BLT r10, same_row
  LDI r2, 10
  LDI r0, 0
  ADD r13, r3          ; y++
  ADD r11, r3          ; row++
same_row:
  LDI r20, 4
  CMP r11, r20
  BLT r10, draw_checker

; --- Copy the 4x4 checkerboard to clipboard ---
LDI r5, 10            ; x
LDI r7, 10            ; y
LDI r1, 4             ; w
LDI r6, 4             ; h
CLIP_COPY r5, r7, r1, r6

; --- Paste it at (130, 130) ---
LDI r4, 130
LDI r15, 130
CLIP_PASTE r4, r15

; --- Draw a horizontal green gradient strip at (10, 50) ---
; 8 pixels: brightness increases from 0x001000 to 0x080000
LDI r2, 10            ; x
LDI r13, 50            ; y
LDI r0, 0             ; col index
LDI r20, 0x001000      ; base green step

draw_gradient:
  MOV r21, r20         ; color = base * (col+1)
  ADD r21, r0
  PSET r2, r13, r21
  ADD r2, r3          ; x++
  ADD r0, r3          ; col++
  LDI r11, 8
  CMP r0, r11
  BLT r10, draw_gradient

; --- Copy the gradient strip ---
LDI r5, 10            ; x
LDI r7, 50            ; y
LDI r1, 8             ; w
LDI r6, 1             ; h
CLIP_COPY r5, r7, r1, r6

; --- Paste gradient at (10, 70) ---
LDI r4, 10
LDI r15, 70
CLIP_PASTE r4, r15

; --- Paste same gradient at (10, 90) ---
LDI r15, 90
CLIP_PASTE r4, r15

; --- Copy checkerboard again and paste at (50, 130) ---
LDI r5, 10
LDI r7, 10
LDI r1, 4
LDI r6, 4
CLIP_COPY r5, r7, r1, r6
LDI r4, 50
LDI r15, 130
CLIP_PASTE r4, r15

HALT
