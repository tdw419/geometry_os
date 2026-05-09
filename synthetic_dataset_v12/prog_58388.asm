; DESCRIPTION: Places a purple 68x22 rectangle at position (331, 201).
; PLAN: r0=331(x), r1=201(y), r2=68(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 201
LDI r2, 68
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
