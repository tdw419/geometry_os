; DESCRIPTION: Draws a black rectangle at (260, 94) with width 47 and height 114.
; PLAN: r0=260(x), r1=94(y), r2=47(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 94
LDI r2, 47
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
