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
LDI r0, 1              ; constant 1 for increments
LDI r3, 0xFF0000       ; red
LDI r12, 0x0000FF       ; blue
LDI r4, 10            ; x
LDI r5, 10            ; y
LDI r15, 0             ; col
LDI r14, 0             ; row
LDI r1, 4             ; width
LDI r13, 4             ; height

draw_checker:
  ; Determine color: if (row + col) is odd, use blue, else red
  MOV r20, r15
  ADD r20, r14
  LDI r21, 1
  AND r20, r21
  JZ r20, use_red
  PSET r4, r5, r12
  JMP next_cell
use_red:
  PSET r4, r5, r3
next_cell:
  ADD r4, r0          ; x++
  ADD r15, r0          ; col++
  LDI r20, 4
  CMP r15, r20
  BLT r9, same_row
  LDI r4, 10
  LDI r15, 0
  ADD r5, r0          ; y++
  ADD r14, r0          ; row++
same_row:
  LDI r20, 4
  CMP r14, r20
  BLT r9, draw_checker

; --- Copy the 4x4 checkerboard to clipboard ---
LDI r3, 10            ; x
LDI r12, 10            ; y
LDI r7, 4             ; w
LDI r11, 4             ; h
CLIP_COPY r3, r12, r7, r11

; --- Paste it at (130, 130) ---
LDI r2, 130
LDI r6, 130
CLIP_PASTE r2, r6

; --- Draw a horizontal green gradient strip at (10, 50) ---
; 8 pixels: brightness increases from 0x001000 to 0x080000
LDI r4, 10            ; x
LDI r5, 50            ; y
LDI r15, 0             ; col index
LDI r20, 0x001000      ; base green step

draw_gradient:
  MOV r21, r20         ; color = base * (col+1)
  ADD r21, r15
  PSET r4, r5, r21
  ADD r4, r0          ; x++
  ADD r15, r0          ; col++
  LDI r14, 8
  CMP r15, r14
  BLT r9, draw_gradient

; --- Copy the gradient strip ---
LDI r3, 10            ; x
LDI r12, 50            ; y
LDI r7, 8             ; w
LDI r11, 1             ; h
CLIP_COPY r3, r12, r7, r11

; --- Paste gradient at (10, 70) ---
LDI r2, 10
LDI r6, 70
CLIP_PASTE r2, r6

; --- Paste same gradient at (10, 90) ---
LDI r6, 90
CLIP_PASTE r2, r6

; --- Copy checkerboard again and paste at (50, 130) ---
LDI r3, 10
LDI r12, 10
LDI r7, 4
LDI r11, 4
CLIP_COPY r3, r12, r7, r11
LDI r2, 50
LDI r6, 130
CLIP_PASTE r2, r6

HALT
