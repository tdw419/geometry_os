; DESCRIPTION: The assembly code is intended to draw three colored pixels on a screen: red at (50,50), green at (100,100), and blue at (150,150). However, due to the deletion of the `LDI r8, 0x00FF00` instruction, pixel (100,100) is incorrectly drawn in red instead of green.

; simple_bug.asm -- Draw three colored pixels
; Intended: (50,50)=red, (100,100)=green, (150,150)=blue
; Bug: pixel (100,100) comes out RED instead of green.
; Agent should use who_wrote 100 100 -> PSET at step N, color=0xFF0000
; Then steps_around N -> see LDI r8, 0xFF0000 (red was never overwritten with green)

LDI r0, 50
LDI r11, 100
LDI r5, 150

; Pixel 1: red at (50,50)
LDI r8, 0xFF0000
PSET r0, r0, r8

; Pixel 2: should be green at (100,100)
; BUG: LDI r8, 0x00FF00 was accidentally deleted
PSET r11, r11, r8   ; r8 still has red!

; Pixel 3: blue at (150,150)
LDI r8, 0x0000FF
PSET r5, r5, r8

HALT
