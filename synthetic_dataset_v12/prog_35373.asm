; DESCRIPTION: Draws a yellow rectangle at (393, 141) with width 73 and height 54.
; PLAN: r0=393(x), r1=141(y), r2=73(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 141
LDI r2, 73
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
