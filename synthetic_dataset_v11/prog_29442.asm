; DESCRIPTION: Draws a black rectangle at (35, 45) with width 81 and height 77.
; PLAN: r0=35(x), r1=45(y), r2=81(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 45
LDI r2, 81
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
