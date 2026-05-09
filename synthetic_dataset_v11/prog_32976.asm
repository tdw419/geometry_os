; DESCRIPTION: Draws a blue rectangle at (87, 170) with width 23 and height 24.
; PLAN: r0=87(x), r1=170(y), r2=23(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 170
LDI r2, 23
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
