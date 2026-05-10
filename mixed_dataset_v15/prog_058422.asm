; DESCRIPTION: Renders a blue box of size 65x29 starting at (428, 201).
; PLAN: r0=428(x), r1=201(y), r2=65(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 201
LDI r2, 65
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
