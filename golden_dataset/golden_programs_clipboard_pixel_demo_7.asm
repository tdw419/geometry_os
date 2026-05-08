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
LDI r10, 1              ; constant 1 for increments
LDI r3, 0xFF0000       ; red
LDI r11, 0x0000FF       ; blue
LDI r9, 10            ; x
LDI r0, 10            ; y
LDI r7, 0             ; col
LDI r6, 0             ; row
LDI r2, 4             ; width
LDI r8, 4             ; height

draw_checker:
  ; Determine color: if (row + col) is odd, use blue, else red
  MOV r20, r7
  ADD r20, r6
  LDI r21, 1
  AND r20, r21
  JZ r20, use_red
  PSET r9, r0, r11
  JMP next_cell
use_red:
  PSET r9, r0, r3
next_cell:
  ADD r9, r10          ; x++
  ADD r7, r10          ; col++
  LDI r20, 4
  CMP r7, r20
  BLT r13, same_row
  LDI r9, 10
  LDI r7, 0
  ADD r0, r10          ; y++
  ADD r6, r10          ; row++
same_row:
  LDI r20, 4
  CMP r6, r20
  BLT r13, draw_checker

; --- Copy the 4x4 checkerboard to clipboard ---
LDI r3, 10            ; x
LDI r11, 10            ; y
LDI r15, 4             ; w
LDI r12, 4             ; h
CLIP_COPY r3, r11, r15, r12

; --- Paste it at (130, 130) ---
LDI r14, 130
LDI r5, 130
CLIP_PASTE r14, r5

; --- Draw a horizontal green gradient strip at (10, 50) ---
; 8 pixels: brightness increases from 0x001000 to 0x080000
LDI r9, 10            ; x
LDI r0, 50            ; y
LDI r7, 0             ; col index
LDI r20, 0x001000      ; base green step

draw_gradient:
  MOV r21, r20         ; color = base * (col+1)
  ADD r21, r7
  PSET r9, r0, r21
  ADD r9, r10          ; x++
  ADD r7, r10          ; col++
  LDI r6, 8
  CMP r7, r6
  BLT r13, draw_gradient

; --- Copy the gradient strip ---
LDI r3, 10            ; x
LDI r11, 50            ; y
LDI r15, 8             ; w
LDI r12, 1             ; h
CLIP_COPY r3, r11, r15, r12

; --- Paste gradient at (10, 70) ---
LDI r14, 10
LDI r5, 70
CLIP_PASTE r14, r5

; --- Paste same gradient at (10, 90) ---
LDI r5, 90
CLIP_PASTE r14, r5

; --- Copy checkerboard again and paste at (50, 130) ---
LDI r3, 10
LDI r11, 10
LDI r15, 4
LDI r12, 4
CLIP_COPY r3, r11, r15, r12
LDI r14, 50
LDI r5, 130
CLIP_PASTE r14, r5

HALT
