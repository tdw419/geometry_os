; DESCRIPTION: Draws a black rectangle at (120, 1) with width 105 and height 116.
; PLAN: r0=120(x), r1=1(y), r2=105(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 1
LDI r2, 105
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
