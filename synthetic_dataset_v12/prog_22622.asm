; DESCRIPTION: Places a purple 44x68 rectangle at position (334, 179).
; PLAN: r0=334(x), r1=179(y), r2=44(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 179
LDI r2, 44
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
