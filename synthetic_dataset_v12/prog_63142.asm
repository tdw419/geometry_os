; DESCRIPTION: Draws a black rectangle at (155, 141) with width 54 and height 113.
; PLAN: r0=155(x), r1=141(y), r2=54(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 141
LDI r2, 54
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
