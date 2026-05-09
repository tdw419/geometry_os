; DESCRIPTION: Draws a purple rectangle at (258, 106) with width 120 and height 61.
; PLAN: r0=258(x), r1=106(y), r2=120(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 106
LDI r2, 120
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
