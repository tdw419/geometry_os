; DESCRIPTION: Places a purple 11x109 rectangle at position (468, 141).
; PLAN: r0=468(x), r1=141(y), r2=11(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 141
LDI r2, 11
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
