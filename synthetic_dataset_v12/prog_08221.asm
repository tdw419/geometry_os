; DESCRIPTION: Places a purple 107x25 rectangle at position (86, 201).
; PLAN: r0=86(x), r1=201(y), r2=107(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 201
LDI r2, 107
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
