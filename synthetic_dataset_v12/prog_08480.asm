; DESCRIPTION: Places a purple 34x101 rectangle at position (331, 109).
; PLAN: r0=331(x), r1=109(y), r2=34(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 109
LDI r2, 34
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
