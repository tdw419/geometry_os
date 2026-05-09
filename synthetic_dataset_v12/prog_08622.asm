; DESCRIPTION: Draws a black rectangle at (194, 68) with width 99 and height 120.
; PLAN: r0=194(x), r1=68(y), r2=99(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 68
LDI r2, 99
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
