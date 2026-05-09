; DESCRIPTION: Draws a black rectangle at (113, 200) with width 81 and height 31.
; PLAN: r0=113(x), r1=200(y), r2=81(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 200
LDI r2, 81
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
