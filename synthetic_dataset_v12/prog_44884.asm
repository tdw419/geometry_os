; DESCRIPTION: Draws a purple rectangle at (363, 116) with width 86 and height 100.
; PLAN: r0=363(x), r1=116(y), r2=86(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 116
LDI r2, 86
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
