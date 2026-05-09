; DESCRIPTION: Draws a purple rectangle at (355, 90) with width 21 and height 120.
; PLAN: r0=355(x), r1=90(y), r2=21(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 90
LDI r2, 21
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
