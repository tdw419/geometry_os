; DESCRIPTION: Draws a yellow rectangle at (194, 62) with width 91 and height 47.
; PLAN: r0=194(x), r1=62(y), r2=91(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 62
LDI r2, 91
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
