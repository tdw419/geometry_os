; DESCRIPTION: Draws a purple rectangle at (143, 70) with width 24 and height 52.
; PLAN: r0=143(x), r1=70(y), r2=24(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 70
LDI r2, 24
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
