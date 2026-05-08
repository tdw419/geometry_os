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
LDI r10, 1              ; constant 1 for increments
LDI r15, 0xFF0000       ; red
LDI r0, 0x0000FF       ; blue
LDI r5, 10            ; x
LDI r9, 10            ; y
LDI r6, 0             ; col
LDI r13, 0             ; row
LDI r12, 4             ; width
LDI r3, 4             ; height

draw_checker:
  ; Determine color: if (row + col) is odd, use blue, else red
  MOV r20, r6
  ADD r20, r13
  LDI r21, 1
  AND r20, r21
  JZ r20, use_red
  PSET r5, r9, r0
  JMP next_cell
use_red:
  PSET r5, r9, r15
next_cell:
  ADD r5, r10          ; x++
  ADD r6, r10          ; col++
  LDI r20, 4
  CMP r6, r20
  BLT r11, same_row
  LDI r5, 10
  LDI r6, 0
  ADD r9, r10          ; y++
  ADD r13, r10          ; row++
same_row:
  LDI r20, 4
  CMP r13, r20
  BLT r11, draw_checker

; --- Copy the 4x4 checkerboard to clipboard ---
LDI r15, 10            ; x
LDI r0, 10            ; y
LDI r2, 4             ; w
LDI r14, 4             ; h
CLIP_COPY r15, r0, r2, r14

; --- Paste it at (130, 130) ---
LDI r7, 130
LDI r4, 130
CLIP_PASTE r7, r4

; --- Draw a horizontal green gradient strip at (10, 50) ---
; 8 pixels: brightness increases from 0x001000 to 0x080000
LDI r5, 10            ; x
LDI r9, 50            ; y
LDI r6, 0             ; col index
LDI r20, 0x001000      ; base green step

draw_gradient:
  MOV r21, r20         ; color = base * (col+1)
  ADD r21, r6
  PSET r5, r9, r21
  ADD r5, r10          ; x++
  ADD r6, r10          ; col++
  LDI r13, 8
  CMP r6, r13
  BLT r11, draw_gradient

; --- Copy the gradient strip ---
LDI r15, 10            ; x
LDI r0, 50            ; y
LDI r2, 8             ; w
LDI r14, 1             ; h
CLIP_COPY r15, r0, r2, r14

; --- Paste gradient at (10, 70) ---
LDI r7, 10
LDI r4, 70
CLIP_PASTE r7, r4

; --- Paste same gradient at (10, 90) ---
LDI r4, 90
CLIP_PASTE r7, r4

; --- Copy checkerboard again and paste at (50, 130) ---
LDI r15, 10
LDI r0, 10
LDI r2, 4
LDI r14, 4
CLIP_COPY r15, r0, r2, r14
LDI r7, 50
LDI r4, 130
CLIP_PASTE r7, r4

HALT
