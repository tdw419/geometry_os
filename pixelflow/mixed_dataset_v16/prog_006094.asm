; DESCRIPTION: Draws a green rectangle at (163, 79) with width 13 and height 18.
; PLAN: r0=163(x), r1=79(y), r2=13(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 79
LDI r2, 13
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
