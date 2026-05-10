; DESCRIPTION: Draws a black rectangle at (275, 14) with width 101 and height 99.
; PLAN: r0=275(x), r1=14(y), r2=101(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 14
LDI r2, 101
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
