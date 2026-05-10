; DESCRIPTION: Places a blue 11x118 box at position (377, 13).
; PLAN: r0=377(x), r1=13(y), r2=11(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 13
LDI r2, 11
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
