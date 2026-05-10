; DESCRIPTION: Draws a blue rectangle at (4, 65) with width 20 and height 112.
; PLAN: r0=4(x), r1=65(y), r2=20(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 65
LDI r2, 20
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
