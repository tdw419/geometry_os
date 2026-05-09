; DESCRIPTION: Draws a yellow rectangle at (141, 73) with width 112 and height 68.
; PLAN: r0=141(x), r1=73(y), r2=112(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 73
LDI r2, 112
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
