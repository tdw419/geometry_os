; DESCRIPTION: Draws a blue rectangle at (8, 10) with width 31 and height 80.
; PLAN: r0=8(x), r1=10(y), r2=31(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 10
LDI r2, 31
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
