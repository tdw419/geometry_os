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
LDI r2, 1              ; constant 1 for increments
LDI r12, 0xFF0000       ; red
LDI r3, 0x0000FF       ; blue
LDI r10, 10            ; x
LDI r1, 10            ; y
LDI r8, 0             ; col
LDI r6, 0             ; row
LDI r13, 4             ; width
LDI r9, 4             ; height

draw_checker:
  ; Determine color: if (row + col) is odd, use blue, else red
  MOV r20, r8
  ADD r20, r6
  LDI r21, 1
  AND r20, r21
  JZ r20, use_red
  PSET r10, r1, r3
  JMP next_cell
use_red:
  PSET r10, r1, r12
next_cell:
  ADD r10, r2          ; x++
  ADD r8, r2          ; col++
  LDI r20, 4
  CMP r8, r20
  BLT r11, same_row
  LDI r10, 10
  LDI r8, 0
  ADD r1, r2          ; y++
  ADD r6, r2          ; row++
same_row:
  LDI r20, 4
  CMP r6, r20
  BLT r11, draw_checker

; --- Copy the 4x4 checkerboard to clipboard ---
LDI r12, 10            ; x
LDI r3, 10            ; y
LDI r14, 4             ; w
LDI r4, 4             ; h
CLIP_COPY r12, r3, r14, r4

; --- Paste it at (130, 130) ---
LDI r0, 130
LDI r5, 130
CLIP_PASTE r0, r5

; --- Draw a horizontal green gradient strip at (10, 50) ---
; 8 pixels: brightness increases from 0x001000 to 0x080000
LDI r10, 10            ; x
LDI r1, 50            ; y
LDI r8, 0             ; col index
LDI r20, 0x001000      ; base green step

draw_gradient:
  MOV r21, r20         ; color = base * (col+1)
  ADD r21, r8
  PSET r10, r1, r21
  ADD r10, r2          ; x++
  ADD r8, r2          ; col++
  LDI r6, 8
  CMP r8, r6
  BLT r11, draw_gradient

; --- Copy the gradient strip ---
LDI r12, 10            ; x
LDI r3, 50            ; y
LDI r14, 8             ; w
LDI r4, 1             ; h
CLIP_COPY r12, r3, r14, r4

; --- Paste gradient at (10, 70) ---
LDI r0, 10
LDI r5, 70
CLIP_PASTE r0, r5

; --- Paste same gradient at (10, 90) ---
LDI r5, 90
CLIP_PASTE r0, r5

; --- Copy checkerboard again and paste at (50, 130) ---
LDI r12, 10
LDI r3, 10
LDI r14, 4
LDI r4, 4
CLIP_COPY r12, r3, r14, r4
LDI r0, 50
LDI r5, 130
CLIP_PASTE r0, r5

HALT
