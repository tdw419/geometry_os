; DESCRIPTION: Draws a black rectangle at (14, 116) with width 94 and height 51.
; PLAN: r0=14(x), r1=116(y), r2=94(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 116
LDI r2, 94
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
