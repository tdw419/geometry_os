; DESCRIPTION: Places a purple 31x101 rectangle at position (13, 114).
; PLAN: r0=13(x), r1=114(y), r2=31(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 114
LDI r2, 31
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
