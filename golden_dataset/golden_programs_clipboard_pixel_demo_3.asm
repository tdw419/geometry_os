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
LDI r8, 1              ; constant 1 for increments
LDI r14, 0xFF0000       ; red
LDI r7, 0x0000FF       ; blue
LDI r6, 10            ; x
LDI r12, 10            ; y
LDI r13, 0             ; col
LDI r15, 0             ; row
LDI r5, 4             ; width
LDI r1, 4             ; height

draw_checker:
  ; Determine color: if (row + col) is odd, use blue, else red
  MOV r20, r13
  ADD r20, r15
  LDI r21, 1
  AND r20, r21
  JZ r20, use_red
  PSET r6, r12, r7
  JMP next_cell
use_red:
  PSET r6, r12, r14
next_cell:
  ADD r6, r8          ; x++
  ADD r13, r8          ; col++
  LDI r20, 4
  CMP r13, r20
  BLT r2, same_row
  LDI r6, 10
  LDI r13, 0
  ADD r12, r8          ; y++
  ADD r15, r8          ; row++
same_row:
  LDI r20, 4
  CMP r15, r20
  BLT r2, draw_checker

; --- Copy the 4x4 checkerboard to clipboard ---
LDI r14, 10            ; x
LDI r7, 10            ; y
LDI r11, 4             ; w
LDI r3, 4             ; h
CLIP_COPY r14, r7, r11, r3

; --- Paste it at (130, 130) ---
LDI r0, 130
LDI r10, 130
CLIP_PASTE r0, r10

; --- Draw a horizontal green gradient strip at (10, 50) ---
; 8 pixels: brightness increases from 0x001000 to 0x080000
LDI r6, 10            ; x
LDI r12, 50            ; y
LDI r13, 0             ; col index
LDI r20, 0x001000      ; base green step

draw_gradient:
  MOV r21, r20         ; color = base * (col+1)
  ADD r21, r13
  PSET r6, r12, r21
  ADD r6, r8          ; x++
  ADD r13, r8          ; col++
  LDI r15, 8
  CMP r13, r15
  BLT r2, draw_gradient

; --- Copy the gradient strip ---
LDI r14, 10            ; x
LDI r7, 50            ; y
LDI r11, 8             ; w
LDI r3, 1             ; h
CLIP_COPY r14, r7, r11, r3

; --- Paste gradient at (10, 70) ---
LDI r0, 10
LDI r10, 70
CLIP_PASTE r0, r10

; --- Paste same gradient at (10, 90) ---
LDI r10, 90
CLIP_PASTE r0, r10

; --- Copy checkerboard again and paste at (50, 130) ---
LDI r14, 10
LDI r7, 10
LDI r11, 4
LDI r3, 4
CLIP_COPY r14, r7, r11, r3
LDI r0, 50
LDI r10, 130
CLIP_PASTE r0, r10

HALT
