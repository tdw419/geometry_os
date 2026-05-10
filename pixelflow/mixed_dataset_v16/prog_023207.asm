; DESCRIPTION: Draws a blue rectangle at (274, 10) with width 22 and height 36.
; PLAN: r0=274(x), r1=10(y), r2=22(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 10
LDI r2, 22
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
