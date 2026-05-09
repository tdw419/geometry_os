; DESCRIPTION: Draws a purple rectangle at (106, 17) with width 48 and height 120.
; PLAN: r0=106(x), r1=17(y), r2=48(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 17
LDI r2, 48
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
