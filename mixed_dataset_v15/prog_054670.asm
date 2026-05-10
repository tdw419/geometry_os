; DESCRIPTION: Draws a black rectangle at (357, 80) with width 56 and height 40.
; PLAN: r0=357(x), r1=80(y), r2=56(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 80
LDI r2, 56
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
