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
LDI r1, 1              ; constant 1 for increments
LDI r13, 0xFF0000       ; red
LDI r5, 0x0000FF       ; blue
LDI r3, 10            ; x
LDI r12, 10            ; y
LDI r6, 0             ; col
LDI r11, 0             ; row
LDI r2, 4             ; width
LDI r0, 4             ; height

draw_checker:
  ; Determine color: if (row + col) is odd, use blue, else red
  MOV r20, r6
  ADD r20, r11
  LDI r21, 1
  AND r20, r21
  JZ r20, use_red
  PSET r3, r12, r5
  JMP next_cell
use_red:
  PSET r3, r12, r13
next_cell:
  ADD r3, r1          ; x++
  ADD r6, r1          ; col++
  LDI r20, 4
  CMP r6, r20
  BLT r8, same_row
  LDI r3, 10
  LDI r6, 0
  ADD r12, r1          ; y++
  ADD r11, r1          ; row++
same_row:
  LDI r20, 4
  CMP r11, r20
  BLT r8, draw_checker

; --- Copy the 4x4 checkerboard to clipboard ---
LDI r13, 10            ; x
LDI r5, 10            ; y
LDI r15, 4             ; w
LDI r7, 4             ; h
CLIP_COPY r13, r5, r15, r7

; --- Paste it at (130, 130) ---
LDI r9, 130
LDI r14, 130
CLIP_PASTE r9, r14

; --- Draw a horizontal green gradient strip at (10, 50) ---
; 8 pixels: brightness increases from 0x001000 to 0x080000
LDI r3, 10            ; x
LDI r12, 50            ; y
LDI r6, 0             ; col index
LDI r20, 0x001000      ; base green step

draw_gradient:
  MOV r21, r20         ; color = base * (col+1)
  ADD r21, r6
  PSET r3, r12, r21
  ADD r3, r1          ; x++
  ADD r6, r1          ; col++
  LDI r11, 8
  CMP r6, r11
  BLT r8, draw_gradient

; --- Copy the gradient strip ---
LDI r13, 10            ; x
LDI r5, 50            ; y
LDI r15, 8             ; w
LDI r7, 1             ; h
CLIP_COPY r13, r5, r15, r7

; --- Paste gradient at (10, 70) ---
LDI r9, 10
LDI r14, 70
CLIP_PASTE r9, r14

; --- Paste same gradient at (10, 90) ---
LDI r14, 90
CLIP_PASTE r9, r14

; --- Copy checkerboard again and paste at (50, 130) ---
LDI r13, 10
LDI r5, 10
LDI r15, 4
LDI r7, 4
CLIP_COPY r13, r5, r15, r7
LDI r9, 50
LDI r14, 130
CLIP_PASTE r9, r14

HALT
