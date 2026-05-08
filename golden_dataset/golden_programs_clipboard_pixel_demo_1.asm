; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

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
LDI r8, 0xFF0000       ; red
LDI r5, 0x0000FF       ; blue
LDI r14, 10            ; x
LDI r12, 10            ; y
LDI r10, 0             ; col
LDI r15, 0             ; row
LDI r11, 4             ; width
LDI r9, 4             ; height

draw_checker:
  ; Determine color: if (row + col) is odd, use blue, else red
  MOV r20, r10
  ADD r20, r15
  LDI r21, 1
  AND r20, r21
  JZ r20, use_red
  PSET r14, r12, r5
  JMP next_cell
use_red:
  PSET r14, r12, r8
next_cell:
  ADD r14, r3          ; x++
  ADD r10, r3          ; col++
  LDI r20, 4
  CMP r10, r20
  BLT r7, same_row
  LDI r14, 10
  LDI r10, 0
  ADD r12, r3          ; y++
  ADD r15, r3          ; row++
same_row:
  LDI r20, 4
  CMP r15, r20
  BLT r7, draw_checker

; --- Copy the 4x4 checkerboard to clipboard ---
LDI r8, 10            ; x
LDI r5, 10            ; y
LDI r6, 4             ; w
LDI r2, 4             ; h
CLIP_COPY r8, r5, r6, r2

; --- Paste it at (130, 130) ---
LDI r13, 130
LDI r4, 130
CLIP_PASTE r13, r4

; --- Draw a horizontal green gradient strip at (10, 50) ---
; 8 pixels: brightness increases from 0x001000 to 0x080000
LDI r14, 10            ; x
LDI r12, 50            ; y
LDI r10, 0             ; col index
LDI r20, 0x001000      ; base green step

draw_gradient:
  MOV r21, r20         ; color = base * (col+1)
  ADD r21, r10
  PSET r14, r12, r21
  ADD r14, r3          ; x++
  ADD r10, r3          ; col++
  LDI r15, 8
  CMP r10, r15
  BLT r7, draw_gradient

; --- Copy the gradient strip ---
LDI r8, 10            ; x
LDI r5, 50            ; y
LDI r6, 8             ; w
LDI r2, 1             ; h
CLIP_COPY r8, r5, r6, r2

; --- Paste gradient at (10, 70) ---
LDI r13, 10
LDI r4, 70
CLIP_PASTE r13, r4

; --- Paste same gradient at (10, 90) ---
LDI r4, 90
CLIP_PASTE r13, r4

; --- Copy checkerboard again and paste at (50, 130) ---
LDI r8, 10
LDI r5, 10
LDI r6, 4
LDI r2, 4
CLIP_COPY r8, r5, r6, r2
LDI r13, 50
LDI r4, 130
CLIP_PASTE r13, r4

HALT
