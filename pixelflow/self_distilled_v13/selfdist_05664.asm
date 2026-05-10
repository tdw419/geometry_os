; DESCRIPTION: Places a purple 31x58 box at position (62, 70).
; PLAN: r0=62(x), r1=70(y), r2=31(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 70
LDI r2, 31
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
