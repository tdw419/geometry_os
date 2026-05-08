; DESCRIPTION: A red object centered at the screen with fixed size.

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
LDI r11, 0xFF0000       ; red
LDI r5, 0x0000FF       ; blue
LDI r6, 10            ; x
LDI r2, 10            ; y
LDI r12, 0             ; col
LDI r15, 0             ; row
LDI r14, 4             ; width
LDI r13, 4             ; height

draw_checker:
  ; Determine color: if (row + col) is odd, use blue, else red
  MOV r20, r12
  ADD r20, r15
  LDI r21, 1
  AND r20, r21
  JZ r20, use_red
  PSET r6, r2, r5
  JMP next_cell
use_red:
  PSET r6, r2, r11
next_cell:
  ADD r6, r4          ; x++
  ADD r12, r4          ; col++
  LDI r20, 4
  CMP r12, r20
  BLT r10, same_row
  LDI r6, 10
  LDI r12, 0
  ADD r2, r4          ; y++
  ADD r15, r4          ; row++
same_row:
  LDI r20, 4
  CMP r15, r20
  BLT r10, draw_checker

; --- Copy the 4x4 checkerboard to clipboard ---
LDI r11, 10            ; x
LDI r5, 10            ; y
LDI r8, 4             ; w
LDI r7, 4             ; h
CLIP_COPY r11, r5, r8, r7

; --- Paste it at (130, 130) ---
LDI r1, 130
LDI r9, 130
CLIP_PASTE r1, r9

; --- Draw a horizontal green gradient strip at (10, 50) ---
; 8 pixels: brightness increases from 0x001000 to 0x080000
LDI r6, 10            ; x
LDI r2, 50            ; y
LDI r12, 0             ; col index
LDI r20, 0x001000      ; base green step

draw_gradient:
  MOV r21, r20         ; color = base * (col+1)
  ADD r21, r12
  PSET r6, r2, r21
  ADD r6, r4          ; x++
  ADD r12, r4          ; col++
  LDI r15, 8
  CMP r12, r15
  BLT r10, draw_gradient

; --- Copy the gradient strip ---
LDI r11, 10            ; x
LDI r5, 50            ; y
LDI r8, 8             ; w
LDI r7, 1             ; h
CLIP_COPY r11, r5, r8, r7

; --- Paste gradient at (10, 70) ---
LDI r1, 10
LDI r9, 70
CLIP_PASTE r1, r9

; --- Paste same gradient at (10, 90) ---
LDI r9, 90
CLIP_PASTE r1, r9

; --- Copy checkerboard again and paste at (50, 130) ---
LDI r11, 10
LDI r5, 10
LDI r8, 4
LDI r7, 4
CLIP_COPY r11, r5, r8, r7
LDI r1, 50
LDI r9, 130
CLIP_PASTE r1, r9

HALT
