; DESCRIPTION: Draws a purple rectangle at (87, 23) with width 44 and height 54.
; PLAN: r0=87(x), r1=23(y), r2=44(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 23
LDI r2, 44
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
