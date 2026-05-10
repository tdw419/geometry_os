; DESCRIPTION: Places a purple 31x106 rectangle at position (366, 82).
; PLAN: r0=366(x), r1=82(y), r2=31(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 82
LDI r2, 31
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
