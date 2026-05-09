; DESCRIPTION: Places a purple 40x96 rectangle at position (201, 15).
; PLAN: r0=201(x), r1=15(y), r2=40(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 15
LDI r2, 40
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
