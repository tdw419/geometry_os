; DESCRIPTION: Draws a purple rectangle at (28, 21) with width 98 and height 20.
; PLAN: r0=28(x), r1=21(y), r2=98(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 21
LDI r2, 98
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
