; DESCRIPTION: Display a rectangle using color red at the screen.

; simple_bug.asm -- Draw three colored pixels
; Intended: (50,50)=red, (100,100)=green, (150,150)=blue
; Bug: pixel (100,100) comes out RED instead of green.
; Agent should use who_wrote 100 100 -> PSET at step N, color=0xFF0000
; Then steps_around N -> see LDI r13, 0xFF0000 (red was never overwritten with green)

LDI r7, 50
LDI r10, 100
LDI r5, 150

; Pixel 1: red at (50,50)
LDI r13, 0xFF0000
PSET r7, r7, r13

; Pixel 2: should be green at (100,100)
; BUG: LDI r13, 0x00FF00 was accidentally deleted
PSET r10, r10, r13   ; r13 still has red!

; Pixel 3: blue at (150,150)
LDI r13, 0x0000FF
PSET r5, r5, r13

HALT
