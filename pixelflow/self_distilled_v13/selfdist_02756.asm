; DESCRIPTION: Places a purple 45x58 box at position (89, 43).
; PLAN: r0=89(x), r1=43(y), r2=45(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 43
LDI r2, 45
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
