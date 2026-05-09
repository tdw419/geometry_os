; DESCRIPTION: Draws a purple rectangle at (190, 116) with width 66 and height 30.
; PLAN: r0=190(x), r1=116(y), r2=66(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 116
LDI r2, 66
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
