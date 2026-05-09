; DESCRIPTION: Draws a black rectangle at (35, 109) with width 75 and height 53.
; PLAN: r0=35(x), r1=109(y), r2=75(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 109
LDI r2, 75
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
