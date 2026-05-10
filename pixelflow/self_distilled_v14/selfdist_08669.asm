; DESCRIPTION: Places a purple 45x26 box at position (185, 145).
; PLAN: r0=185(x), r1=145(y), r2=45(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 145
LDI r2, 45
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
