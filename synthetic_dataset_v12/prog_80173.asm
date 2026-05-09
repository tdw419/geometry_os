; DESCRIPTION: Draws a green rectangle at (279, 21) with width 15 and height 100.
; PLAN: r0=279(x), r1=21(y), r2=15(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 21
LDI r2, 15
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
