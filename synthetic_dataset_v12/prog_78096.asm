; DESCRIPTION: Places a purple 23x14 rectangle at position (448, 201).
; PLAN: r0=448(x), r1=201(y), r2=23(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 201
LDI r2, 23
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
