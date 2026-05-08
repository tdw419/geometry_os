; DESCRIPTION: This GeOS assembly code draws a red/blue checkerboard and a green gradient strip on the screen, copies these patterns to the clipboard using `CLIP_COPY`, and then pastes them at different locations using `CLIP_PASTE`. The demonstration showcases cross-region pixel sharing between programs.

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
LDI r13, 1              ; constant 1 for increments
LDI r15, 0xFF0000       ; red
LDI r2, 0x0000FF       ; blue
LDI r8, 10            ; x
LDI r10, 10            ; y
LDI r12, 0             ; col
LDI r0, 0             ; row
LDI r14, 4             ; width
LDI r9, 4             ; height

draw_checker:
  ; Determine color: if (row + col) is odd, use blue, else red
  MOV r20, r12
  ADD r20, r0
  LDI r21, 1
  AND r20, r21
  JZ r20, use_red
  PSET r8, r10, r2
  JMP next_cell
use_red:
  PSET r8, r10, r15
next_cell:
  ADD r8, r13          ; x++
  ADD r12, r13          ; col++
  LDI r20, 4
  CMP r12, r20
  BLT r6, same_row
  LDI r8, 10
  LDI r12, 0
  ADD r10, r13          ; y++
  ADD r0, r13          ; row++
same_row:
  LDI r20, 4
  CMP r0, r20
  BLT r6, draw_checker

; --- Copy the 4x4 checkerboard to clipboard ---
LDI r15, 10            ; x
LDI r2, 10            ; y
LDI r5, 4             ; w
LDI r3, 4             ; h
CLIP_COPY r15, r2, r5, r3

; --- Paste it at (130, 130) ---
LDI r1, 130
LDI r11, 130
CLIP_PASTE r1, r11

; --- Draw a horizontal green gradient strip at (10, 50) ---
; 8 pixels: brightness increases from 0x001000 to 0x080000
LDI r8, 10            ; x
LDI r10, 50            ; y
LDI r12, 0             ; col index
LDI r20, 0x001000      ; base green step

draw_gradient:
  MOV r21, r20         ; color = base * (col+1)
  ADD r21, r12
  PSET r8, r10, r21
  ADD r8, r13          ; x++
  ADD r12, r13          ; col++
  LDI r0, 8
  CMP r12, r0
  BLT r6, draw_gradient

; --- Copy the gradient strip ---
LDI r15, 10            ; x
LDI r2, 50            ; y
LDI r5, 8             ; w
LDI r3, 1             ; h
CLIP_COPY r15, r2, r5, r3

; --- Paste gradient at (10, 70) ---
LDI r1, 10
LDI r11, 70
CLIP_PASTE r1, r11

; --- Paste same gradient at (10, 90) ---
LDI r11, 90
CLIP_PASTE r1, r11

; --- Copy checkerboard again and paste at (50, 130) ---
LDI r15, 10
LDI r2, 10
LDI r5, 4
LDI r3, 4
CLIP_COPY r15, r2, r5, r3
LDI r1, 50
LDI r11, 130
CLIP_PASTE r1, r11

HALT
