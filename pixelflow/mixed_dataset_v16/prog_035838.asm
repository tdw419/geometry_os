; DESCRIPTION: Draws a black rectangle at (189, 145) with width 26 and height 96.
; PLAN: r0=189(x), r1=145(y), r2=26(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 145
LDI r2, 26
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
