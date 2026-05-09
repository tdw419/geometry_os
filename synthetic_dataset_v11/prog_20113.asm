; DESCRIPTION: Draws a purple rectangle at (134, 10) with width 116 and height 23.
; PLAN: r0=134(x), r1=10(y), r2=116(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 10
LDI r2, 116
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
