; DESCRIPTION: Draws a purple rectangle at (30, 153) with width 87 and height 85.
; PLAN: r0=30(x), r1=153(y), r2=87(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 153
LDI r2, 87
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
