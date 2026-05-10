; DESCRIPTION: Places a purple 44x117 rectangle at position (331, 45).
; PLAN: r0=331(x), r1=45(y), r2=44(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 45
LDI r2, 44
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
