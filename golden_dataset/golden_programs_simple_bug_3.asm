; DESCRIPTION: Render a red rectangle at the screen.

; simple_bug.asm -- Draw three colored pixels
; Intended: (50,50)=red, (100,100)=green, (150,150)=blue
; Bug: pixel (100,100) comes out RED instead of green.
; Agent should use who_wrote 100 100 -> PSET at step N, color=0xFF0000
; Then steps_around N -> see LDI r11, 0xFF0000 (red was never overwritten with green)

LDI r3, 50
LDI r13, 100
LDI r0, 150

; Pixel 1: red at (50,50)
LDI r11, 0xFF0000
PSET r3, r3, r11

; Pixel 2: should be green at (100,100)
; BUG: LDI r11, 0x00FF00 was accidentally deleted
PSET r13, r13, r11   ; r11 still has red!

; Pixel 3: blue at (150,150)
LDI r11, 0x0000FF
PSET r0, r0, r11

HALT
