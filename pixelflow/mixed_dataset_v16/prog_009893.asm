; DESCRIPTION: Draws a black rectangle at (14, 145) with width 44 and height 39.
; PLAN: r0=14(x), r1=145(y), r2=44(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 145
LDI r2, 44
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
