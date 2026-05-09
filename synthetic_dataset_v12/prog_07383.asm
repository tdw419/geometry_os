; DESCRIPTION: Places a purple 31x13 rectangle at position (312, 193).
; PLAN: r0=312(x), r1=193(y), r2=31(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 193
LDI r2, 31
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
