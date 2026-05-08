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
LDI r3, 1              ; constant 1 for increments
LDI r5, 0xFF0000       ; red
LDI r0, 0x0000FF       ; blue
LDI r8, 10            ; x
LDI r14, 10            ; y
LDI r12, 0             ; col
LDI r15, 0             ; row
LDI r2, 4             ; width
LDI r4, 4             ; height

draw_checker:
  ; Determine color: if (row + col) is odd, use blue, else red
  MOV r20, r12
  ADD r20, r15
  LDI r21, 1
  AND r20, r21
  JZ r20, use_red
  PSET r8, r14, r0
  JMP next_cell
use_red:
  PSET r8, r14, r5
next_cell:
  ADD r8, r3          ; x++
  ADD r12, r3          ; col++
  LDI r20, 4
  CMP r12, r20
  BLT r1, same_row
  LDI r8, 10
  LDI r12, 0
  ADD r14, r3          ; y++
  ADD r15, r3          ; row++
same_row:
  LDI r20, 4
  CMP r15, r20
  BLT r1, draw_checker

; --- Copy the 4x4 checkerboard to clipboard ---
LDI r5, 10            ; x
LDI r0, 10            ; y
LDI r9, 4             ; w
LDI r6, 4             ; h
CLIP_COPY r5, r0, r9, r6

; --- Paste it at (130, 130) ---
LDI r7, 130
LDI r13, 130
CLIP_PASTE r7, r13

; --- Draw a horizontal green gradient strip at (10, 50) ---
; 8 pixels: brightness increases from 0x001000 to 0x080000
LDI r8, 10            ; x
LDI r14, 50            ; y
LDI r12, 0             ; col index
LDI r20, 0x001000      ; base green step

draw_gradient:
  MOV r21, r20         ; color = base * (col+1)
  ADD r21, r12
  PSET r8, r14, r21
  ADD r8, r3          ; x++
  ADD r12, r3          ; col++
  LDI r15, 8
  CMP r12, r15
  BLT r1, draw_gradient

; --- Copy the gradient strip ---
LDI r5, 10            ; x
LDI r0, 50            ; y
LDI r9, 8             ; w
LDI r6, 1             ; h
CLIP_COPY r5, r0, r9, r6

; --- Paste gradient at (10, 70) ---
LDI r7, 10
LDI r13, 70
CLIP_PASTE r7, r13

; --- Paste same gradient at (10, 90) ---
LDI r13, 90
CLIP_PASTE r7, r13

; --- Copy checkerboard again and paste at (50, 130) ---
LDI r5, 10
LDI r0, 10
LDI r9, 4
LDI r6, 4
CLIP_COPY r5, r0, r9, r6
LDI r7, 50
LDI r13, 130
CLIP_PASTE r7, r13

HALT
