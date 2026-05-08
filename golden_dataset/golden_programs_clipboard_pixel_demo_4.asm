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
LDI r0, 1              ; constant 1 for increments
LDI r14, 0xFF0000       ; red
LDI r8, 0x0000FF       ; blue
LDI r12, 10            ; x
LDI r10, 10            ; y
LDI r3, 0             ; col
LDI r15, 0             ; row
LDI r9, 4             ; width
LDI r2, 4             ; height

draw_checker:
  ; Determine color: if (row + col) is odd, use blue, else red
  MOV r20, r3
  ADD r20, r15
  LDI r21, 1
  AND r20, r21
  JZ r20, use_red
  PSET r12, r10, r8
  JMP next_cell
use_red:
  PSET r12, r10, r14
next_cell:
  ADD r12, r0          ; x++
  ADD r3, r0          ; col++
  LDI r20, 4
  CMP r3, r20
  BLT r6, same_row
  LDI r12, 10
  LDI r3, 0
  ADD r10, r0          ; y++
  ADD r15, r0          ; row++
same_row:
  LDI r20, 4
  CMP r15, r20
  BLT r6, draw_checker

; --- Copy the 4x4 checkerboard to clipboard ---
LDI r14, 10            ; x
LDI r8, 10            ; y
LDI r13, 4             ; w
LDI r7, 4             ; h
CLIP_COPY r14, r8, r13, r7

; --- Paste it at (130, 130) ---
LDI r11, 130
LDI r5, 130
CLIP_PASTE r11, r5

; --- Draw a horizontal green gradient strip at (10, 50) ---
; 8 pixels: brightness increases from 0x001000 to 0x080000
LDI r12, 10            ; x
LDI r10, 50            ; y
LDI r3, 0             ; col index
LDI r20, 0x001000      ; base green step

draw_gradient:
  MOV r21, r20         ; color = base * (col+1)
  ADD r21, r3
  PSET r12, r10, r21
  ADD r12, r0          ; x++
  ADD r3, r0          ; col++
  LDI r15, 8
  CMP r3, r15
  BLT r6, draw_gradient

; --- Copy the gradient strip ---
LDI r14, 10            ; x
LDI r8, 50            ; y
LDI r13, 8             ; w
LDI r7, 1             ; h
CLIP_COPY r14, r8, r13, r7

; --- Paste gradient at (10, 70) ---
LDI r11, 10
LDI r5, 70
CLIP_PASTE r11, r5

; --- Paste same gradient at (10, 90) ---
LDI r5, 90
CLIP_PASTE r11, r5

; --- Copy checkerboard again and paste at (50, 130) ---
LDI r14, 10
LDI r8, 10
LDI r13, 4
LDI r7, 4
CLIP_COPY r14, r8, r13, r7
LDI r11, 50
LDI r5, 130
CLIP_PASTE r11, r5

HALT
