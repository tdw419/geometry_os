; DESCRIPTION: Draws a yellow rectangle at (314, 73) with width 38 and height 107.
; PLAN: r0=314(x), r1=73(y), r2=38(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 73
LDI r2, 38
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
