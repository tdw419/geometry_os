; DESCRIPTION: Draws a black rectangle at (109, 49) with width 116 and height 53.
; PLAN: r0=109(x), r1=49(y), r2=116(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 49
LDI r2, 116
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
