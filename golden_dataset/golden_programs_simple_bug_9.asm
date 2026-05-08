; DESCRIPTION: Draws a red rectangle at the screen with fixed size.

; simple_bug.asm -- Draw three colored pixels
; Intended: (50,50)=red, (100,100)=green, (150,150)=blue
; Bug: pixel (100,100) comes out RED instead of green.
; Agent should use who_wrote 100 100 -> PSET at step N, color=0xFF0000
; Then steps_around N -> see LDI r3, 0xFF0000 (red was never overwritten with green)

LDI r0, 50
LDI r1, 100
LDI r6, 150

; Pixel 1: red at (50,50)
LDI r3, 0xFF0000
PSET r0, r0, r3

; Pixel 2: should be green at (100,100)
; BUG: LDI r3, 0x00FF00 was accidentally deleted
PSET r1, r1, r3   ; r3 still has red!

; Pixel 3: blue at (150,150)
LDI r3, 0x0000FF
PSET r6, r6, r3

HALT
