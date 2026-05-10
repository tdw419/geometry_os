; DESCRIPTION: Draws a yellow rectangle at (121, 142) with width 117 and height 74.
; PLAN: r0=121(x), r1=142(y), r2=117(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 142
LDI r2, 117
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
