; DESCRIPTION: Draws a red object at the screen with fixed size.

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
LDI r5, 1              ; constant 1 for increments
LDI r6, 0xFF0000       ; red
LDI r0, 0x0000FF       ; blue
LDI r2, 10            ; x
LDI r9, 10            ; y
LDI r3, 0             ; col
LDI r1, 0             ; row
LDI r8, 4             ; width
LDI r11, 4             ; height

draw_checker:
  ; Determine color: if (row + col) is odd, use blue, else red
  MOV r20, r3
  ADD r20, r1
  LDI r21, 1
  AND r20, r21
  JZ r20, use_red
  PSET r2, r9, r0
  JMP next_cell
use_red:
  PSET r2, r9, r6
next_cell:
  ADD r2, r5          ; x++
  ADD r3, r5          ; col++
  LDI r20, 4
  CMP r3, r20
  BLT r14, same_row
  LDI r2, 10
  LDI r3, 0
  ADD r9, r5          ; y++
  ADD r1, r5          ; row++
same_row:
  LDI r20, 4
  CMP r1, r20
  BLT r14, draw_checker

; --- Copy the 4x4 checkerboard to clipboard ---
LDI r6, 10            ; x
LDI r0, 10            ; y
LDI r15, 4             ; w
LDI r13, 4             ; h
CLIP_COPY r6, r0, r15, r13

; --- Paste it at (130, 130) ---
LDI r4, 130
LDI r10, 130
CLIP_PASTE r4, r10

; --- Draw a horizontal green gradient strip at (10, 50) ---
; 8 pixels: brightness increases from 0x001000 to 0x080000
LDI r2, 10            ; x
LDI r9, 50            ; y
LDI r3, 0             ; col index
LDI r20, 0x001000      ; base green step

draw_gradient:
  MOV r21, r20         ; color = base * (col+1)
  ADD r21, r3
  PSET r2, r9, r21
  ADD r2, r5          ; x++
  ADD r3, r5          ; col++
  LDI r1, 8
  CMP r3, r1
  BLT r14, draw_gradient

; --- Copy the gradient strip ---
LDI r6, 10            ; x
LDI r0, 50            ; y
LDI r15, 8             ; w
LDI r13, 1             ; h
CLIP_COPY r6, r0, r15, r13

; --- Paste gradient at (10, 70) ---
LDI r4, 10
LDI r10, 70
CLIP_PASTE r4, r10

; --- Paste same gradient at (10, 90) ---
LDI r10, 90
CLIP_PASTE r4, r10

; --- Copy checkerboard again and paste at (50, 130) ---
LDI r6, 10
LDI r0, 10
LDI r15, 4
LDI r13, 4
CLIP_COPY r6, r0, r15, r13
LDI r4, 50
LDI r10, 130
CLIP_PASTE r4, r10

HALT
