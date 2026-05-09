; DESCRIPTION: Draws a yellow rectangle at (95, 87) with width 62 and height 112.
; PLAN: r0=95(x), r1=87(y), r2=62(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 87
LDI r2, 62
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
