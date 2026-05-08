; DESCRIPTION: Display a object using color red at the screen.

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
LDI r14, 0xFF0000       ; red
LDI r2, 0x0000FF       ; blue
LDI r12, 10            ; x
LDI r15, 10            ; y
LDI r4, 0             ; col
LDI r8, 0             ; row
LDI r1, 4             ; width
LDI r0, 4             ; height

draw_checker:
  ; Determine color: if (row + col) is odd, use blue, else red
  MOV r20, r4
  ADD r20, r8
  LDI r21, 1
  AND r20, r21
  JZ r20, use_red
  PSET r12, r15, r2
  JMP next_cell
use_red:
  PSET r12, r15, r14
next_cell:
  ADD r12, r3          ; x++
  ADD r4, r3          ; col++
  LDI r20, 4
  CMP r4, r20
  BLT r11, same_row
  LDI r12, 10
  LDI r4, 0
  ADD r15, r3          ; y++
  ADD r8, r3          ; row++
same_row:
  LDI r20, 4
  CMP r8, r20
  BLT r11, draw_checker

; --- Copy the 4x4 checkerboard to clipboard ---
LDI r14, 10            ; x
LDI r2, 10            ; y
LDI r10, 4             ; w
LDI r7, 4             ; h
CLIP_COPY r14, r2, r10, r7

; --- Paste it at (130, 130) ---
LDI r13, 130
LDI r9, 130
CLIP_PASTE r13, r9

; --- Draw a horizontal green gradient strip at (10, 50) ---
; 8 pixels: brightness increases from 0x001000 to 0x080000
LDI r12, 10            ; x
LDI r15, 50            ; y
LDI r4, 0             ; col index
LDI r20, 0x001000      ; base green step

draw_gradient:
  MOV r21, r20         ; color = base * (col+1)
  ADD r21, r4
  PSET r12, r15, r21
  ADD r12, r3          ; x++
  ADD r4, r3          ; col++
  LDI r8, 8
  CMP r4, r8
  BLT r11, draw_gradient

; --- Copy the gradient strip ---
LDI r14, 10            ; x
LDI r2, 50            ; y
LDI r10, 8             ; w
LDI r7, 1             ; h
CLIP_COPY r14, r2, r10, r7

; --- Paste gradient at (10, 70) ---
LDI r13, 10
LDI r9, 70
CLIP_PASTE r13, r9

; --- Paste same gradient at (10, 90) ---
LDI r9, 90
CLIP_PASTE r13, r9

; --- Copy checkerboard again and paste at (50, 130) ---
LDI r14, 10
LDI r2, 10
LDI r10, 4
LDI r7, 4
CLIP_COPY r14, r2, r10, r7
LDI r13, 50
LDI r9, 130
CLIP_PASTE r13, r9

HALT
