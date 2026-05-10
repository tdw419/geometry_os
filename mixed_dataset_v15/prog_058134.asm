; DESCRIPTION: Draws a black rectangle at (424, 100) with width 40 and height 40.
; PLAN: r0=424(x), r1=100(y), r2=40(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 100
LDI r2, 40
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
