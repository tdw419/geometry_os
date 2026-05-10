; DESCRIPTION: Places a purple 120x16 box at position (201, 165).
; PLAN: r0=201(x), r1=165(y), r2=120(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 165
LDI r2, 120
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
