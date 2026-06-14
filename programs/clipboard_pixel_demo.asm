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
LDI r7, 1              ; constant 1 for increments
LDI r1, 0xFF0000       ; red
LDI r2, 0x0000FF       ; blue
LDI r10, 10            ; x
LDI r11, 10            ; y
LDI r12, 0             ; col
LDI r13, 0             ; row
LDI r14, 4             ; width
LDI r15, 4             ; height

draw_checker:
  ; Determine color: if (row + col) is odd, use blue, else red
  MOV r20, r12
  ADD r20, r13
  LDI r21, 1
  AND r20, r21
  JZ r20, use_red
  PSET r10, r11, r2
  JMP next_cell
use_red:
  PSET r10, r11, r1
next_cell:
  ADD r10, r7          ; x++
  ADD r12, r7          ; col++
  LDI r20, 4
  CMP r12, r20
  BLT r0, same_row
  LDI r10, 10
  LDI r12, 0
  ADD r11, r7          ; y++
  ADD r13, r7          ; row++
same_row:
  LDI r20, 4
  CMP r13, r20
  BLT r0, draw_checker

; --- Copy the 4x4 checkerboard to clipboard ---
LDI r1, 10            ; x
LDI r2, 10            ; y
LDI r3, 4             ; w
LDI r4, 4             ; h
CLIP_COPY r1, r2, r3, r4

; --- Paste it at (130, 130) ---
LDI r5, 130
LDI r6, 130
CLIP_PASTE r5, r6

; --- Draw a horizontal green gradient strip at (10, 50) ---
; 8 pixels: brightness increases from 0x001000 to 0x080000
LDI r10, 10            ; x
LDI r11, 50            ; y
LDI r12, 0             ; col index
LDI r20, 0x001000      ; base green step

draw_gradient:
  MOV r21, r20         ; color = base * (col+1)
  ADD r21, r12
  PSET r10, r11, r21
  ADD r10, r7          ; x++
  ADD r12, r7          ; col++
  LDI r13, 8
  CMP r12, r13
  BLT r0, draw_gradient

; --- Copy the gradient strip ---
LDI r1, 10            ; x
LDI r2, 50            ; y
LDI r3, 8             ; w
LDI r4, 1             ; h
CLIP_COPY r1, r2, r3, r4

; --- Paste gradient at (10, 70) ---
LDI r5, 10
LDI r6, 70
CLIP_PASTE r5, r6

; --- Paste same gradient at (10, 90) ---
LDI r6, 90
CLIP_PASTE r5, r6

; --- Copy checkerboard again and paste at (50, 130) ---
LDI r1, 10
LDI r2, 10
LDI r3, 4
LDI r4, 4
CLIP_COPY r1, r2, r3, r4
LDI r5, 50
LDI r6, 130
CLIP_PASTE r5, r6

HALT
