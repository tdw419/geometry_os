; DESCRIPTION: Draws a purple rectangle at (62, 52) with width 70 and height 120.
; PLAN: r0=62(x), r1=52(y), r2=70(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 52
LDI r2, 70
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
