; DESCRIPTION: Draws a purple rectangle at (160, 77) with width 90 and height 75.
; PLAN: r0=160(x), r1=77(y), r2=90(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 77
LDI r2, 90
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
