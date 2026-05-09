; DESCRIPTION: Draws a yellow rectangle at (226, 15) with width 13 and height 73.
; PLAN: r0=226(x), r1=15(y), r2=13(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 15
LDI r2, 13
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
