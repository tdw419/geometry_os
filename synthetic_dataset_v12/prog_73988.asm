; DESCRIPTION: Draws a blue rectangle at (454, 170) with width 52 and height 21.
; PLAN: r0=454(x), r1=170(y), r2=52(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 170
LDI r2, 52
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
