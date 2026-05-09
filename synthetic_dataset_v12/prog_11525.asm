; DESCRIPTION: Draws a black rectangle at (390, 21) with width 92 and height 75.
; PLAN: r0=390(x), r1=21(y), r2=92(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 21
LDI r2, 92
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
