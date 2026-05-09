; DESCRIPTION: Places a purple 115x31 rectangle at position (141, 90).
; PLAN: r0=141(x), r1=90(y), r2=115(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 90
LDI r2, 115
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
