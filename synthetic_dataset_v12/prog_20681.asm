; DESCRIPTION: Draws a blue rectangle at (123, 56) with width 12 and height 89.
; PLAN: r0=123(x), r1=56(y), r2=12(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 56
LDI r2, 12
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
