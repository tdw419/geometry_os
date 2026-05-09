; DESCRIPTION: Draws a yellow rectangle at (95, 101) with width 19 and height 47.
; PLAN: r0=95(x), r1=101(y), r2=19(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 101
LDI r2, 19
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
