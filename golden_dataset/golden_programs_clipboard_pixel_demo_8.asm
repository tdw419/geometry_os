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
LDI r4, 1              ; constant 1 for increments
LDI r15, 0xFF0000       ; red
LDI r5, 0x0000FF       ; blue
LDI r0, 10            ; x
LDI r7, 10            ; y
LDI r1, 0             ; col
LDI r10, 0             ; row
LDI r6, 4             ; width
LDI r14, 4             ; height

draw_checker:
  ; Determine color: if (row + col) is odd, use blue, else red
  MOV r20, r1
  ADD r20, r10
  LDI r21, 1
  AND r20, r21
  JZ r20, use_red
  PSET r0, r7, r5
  JMP next_cell
use_red:
  PSET r0, r7, r15
next_cell:
  ADD r0, r4          ; x++
  ADD r1, r4          ; col++
  LDI r20, 4
  CMP r1, r20
  BLT r2, same_row
  LDI r0, 10
  LDI r1, 0
  ADD r7, r4          ; y++
  ADD r10, r4          ; row++
same_row:
  LDI r20, 4
  CMP r10, r20
  BLT r2, draw_checker

; --- Copy the 4x4 checkerboard to clipboard ---
LDI r15, 10            ; x
LDI r5, 10            ; y
LDI r13, 4             ; w
LDI r9, 4             ; h
CLIP_COPY r15, r5, r13, r9

; --- Paste it at (130, 130) ---
LDI r11, 130
LDI r8, 130
CLIP_PASTE r11, r8

; --- Draw a horizontal green gradient strip at (10, 50) ---
; 8 pixels: brightness increases from 0x001000 to 0x080000
LDI r0, 10            ; x
LDI r7, 50            ; y
LDI r1, 0             ; col index
LDI r20, 0x001000      ; base green step

draw_gradient:
  MOV r21, r20         ; color = base * (col+1)
  ADD r21, r1
  PSET r0, r7, r21
  ADD r0, r4          ; x++
  ADD r1, r4          ; col++
  LDI r10, 8
  CMP r1, r10
  BLT r2, draw_gradient

; --- Copy the gradient strip ---
LDI r15, 10            ; x
LDI r5, 50            ; y
LDI r13, 8             ; w
LDI r9, 1             ; h
CLIP_COPY r15, r5, r13, r9

; --- Paste gradient at (10, 70) ---
LDI r11, 10
LDI r8, 70
CLIP_PASTE r11, r8

; --- Paste same gradient at (10, 90) ---
LDI r8, 90
CLIP_PASTE r11, r8

; --- Copy checkerboard again and paste at (50, 130) ---
LDI r15, 10
LDI r5, 10
LDI r13, 4
LDI r9, 4
CLIP_COPY r15, r5, r13, r9
LDI r11, 50
LDI r8, 130
CLIP_PASTE r11, r8

HALT
