; DESCRIPTION: The assembly code is intended to draw three colored pixels on a screen: red at (50,50), green at (100,100), and blue at (150,150). However, due to the deletion of the `LDI r6, 0x00FF00` instruction, pixel (100,100) is incorrectly drawn in red instead of green.

; simple_bug.asm -- Draw three colored pixels
; Intended: (50,50)=red, (100,100)=green, (150,150)=blue
; Bug: pixel (100,100) comes out RED instead of green.
; Agent should use who_wrote 100 100 -> PSET at step N, color=0xFF0000
; Then steps_around N -> see LDI r6, 0xFF0000 (red was never overwritten with green)

LDI r5, 50
LDI r1, 100
LDI r9, 150

; Pixel 1: red at (50,50)
LDI r6, 0xFF0000
PSET r5, r5, r6

; Pixel 2: should be green at (100,100)
; BUG: LDI r6, 0x00FF00 was accidentally deleted
PSET r1, r1, r6   ; r6 still has red!

; Pixel 3: blue at (150,150)
LDI r6, 0x0000FF
PSET r9, r9, r6

HALT
