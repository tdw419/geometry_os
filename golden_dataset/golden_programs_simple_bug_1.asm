; DESCRIPTION: Geometry OS program to draw a red rectangle.

; simple_bug.asm -- Draw three colored pixels
; Intended: (50,50)=red, (100,100)=green, (150,150)=blue
; Bug: pixel (100,100) comes out RED instead of green.
; Agent should use who_wrote 100 100 -> PSET at step N, color=0xFF0000
; Then steps_around N -> see LDI r5, 0xFF0000 (red was never overwritten with green)

LDI r8, 50
LDI r9, 100
LDI r14, 150

; Pixel 1: red at (50,50)
LDI r5, 0xFF0000
PSET r8, r8, r5

; Pixel 2: should be green at (100,100)
; BUG: LDI r5, 0x00FF00 was accidentally deleted
PSET r9, r9, r5   ; r5 still has red!

; Pixel 3: blue at (150,150)
LDI r5, 0x0000FF
PSET r14, r14, r5

HALT
