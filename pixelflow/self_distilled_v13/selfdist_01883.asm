; DESCRIPTION: Places a purple 10x110 box at position (378, 72).
; PLAN: r0=378(x), r1=72(y), r2=10(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 72
LDI r2, 10
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
