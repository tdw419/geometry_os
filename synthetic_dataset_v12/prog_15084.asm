; DESCRIPTION: Draws a black rectangle at (357, 13) with width 90 and height 96.
; PLAN: r0=357(x), r1=13(y), r2=90(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 13
LDI r2, 90
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
