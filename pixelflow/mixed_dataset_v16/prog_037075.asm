; DESCRIPTION: Places a purple 29x96 box at position (139, 80).
; PLAN: r0=139(x), r1=80(y), r2=29(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 80
LDI r2, 29
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
