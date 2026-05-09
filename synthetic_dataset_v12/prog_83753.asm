; DESCRIPTION: Draws a black rectangle at (80, 92) with width 47 and height 116.
; PLAN: r0=80(x), r1=92(y), r2=47(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 92
LDI r2, 47
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
