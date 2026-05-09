; DESCRIPTION: Draws a black rectangle at (58, 141) with width 40 and height 114.
; PLAN: r0=58(x), r1=141(y), r2=40(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 141
LDI r2, 40
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
