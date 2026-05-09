; DESCRIPTION: Draws a yellow rectangle at (194, 76) with width 21 and height 57.
; PLAN: r0=194(x), r1=76(y), r2=21(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 76
LDI r2, 21
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
