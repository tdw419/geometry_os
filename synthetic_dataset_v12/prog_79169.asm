; DESCRIPTION: Draws a purple rectangle at (139, 159) with width 120 and height 17.
; PLAN: r0=139(x), r1=159(y), r2=120(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 159
LDI r2, 120
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
