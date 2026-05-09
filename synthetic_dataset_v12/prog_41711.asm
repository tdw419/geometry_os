; DESCRIPTION: Draws a purple rectangle at (255, 56) with width 81 and height 120.
; PLAN: r0=255(x), r1=56(y), r2=81(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 56
LDI r2, 81
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
