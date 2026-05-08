; DESCRIPTION: Geometry OS program to draw a red object.

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
LDI r10, 0xFF0000       ; red
LDI r4, 0x0000FF       ; blue
LDI r8, 10            ; x
LDI r14, 10            ; y
LDI r13, 0             ; col
LDI r15, 0             ; row
LDI r2, 4             ; width
LDI r1, 4             ; height

draw_checker:
  ; Determine color: if (row + col) is odd, use blue, else red
  MOV r20, r13
  ADD r20, r15
  LDI r21, 1
  AND r20, r21
  JZ r20, use_red
  PSET r8, r14, r4
  JMP next_cell
use_red:
  PSET r8, r14, r10
next_cell:
  ADD r8, r0          ; x++
  ADD r13, r0          ; col++
  LDI r20, 4
  CMP r13, r20
  BLT r5, same_row
  LDI r8, 10
  LDI r13, 0
  ADD r14, r0          ; y++
  ADD r15, r0          ; row++
same_row:
  LDI r20, 4
  CMP r15, r20
  BLT r5, draw_checker

; --- Copy the 4x4 checkerboard to clipboard ---
LDI r10, 10            ; x
LDI r4, 10            ; y
LDI r3, 4             ; w
LDI r7, 4             ; h
CLIP_COPY r10, r4, r3, r7

; --- Paste it at (130, 130) ---
LDI r9, 130
LDI r11, 130
CLIP_PASTE r9, r11

; --- Draw a horizontal green gradient strip at (10, 50) ---
; 8 pixels: brightness increases from 0x001000 to 0x080000
LDI r8, 10            ; x
LDI r14, 50            ; y
LDI r13, 0             ; col index
LDI r20, 0x001000      ; base green step

draw_gradient:
  MOV r21, r20         ; color = base * (col+1)
  ADD r21, r13
  PSET r8, r14, r21
  ADD r8, r0          ; x++
  ADD r13, r0          ; col++
  LDI r15, 8
  CMP r13, r15
  BLT r5, draw_gradient

; --- Copy the gradient strip ---
LDI r10, 10            ; x
LDI r4, 50            ; y
LDI r3, 8             ; w
LDI r7, 1             ; h
CLIP_COPY r10, r4, r3, r7

; --- Paste gradient at (10, 70) ---
LDI r9, 10
LDI r11, 70
CLIP_PASTE r9, r11

; --- Paste same gradient at (10, 90) ---
LDI r11, 90
CLIP_PASTE r9, r11

; --- Copy checkerboard again and paste at (50, 130) ---
LDI r10, 10
LDI r4, 10
LDI r3, 4
LDI r7, 4
CLIP_COPY r10, r4, r3, r7
LDI r9, 50
LDI r11, 130
CLIP_PASTE r9, r11

HALT
