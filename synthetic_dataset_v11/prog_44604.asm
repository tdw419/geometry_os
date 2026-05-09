; DESCRIPTION: Places a blue 20x101 rectangle at position (201, 141).
; PLAN: r0=201(x), r1=141(y), r2=20(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 141
LDI r2, 20
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
