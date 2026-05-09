; DESCRIPTION: Places a purple 85x118 rectangle at position (9, 81).
; PLAN: r0=9(x), r1=81(y), r2=85(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 81
LDI r2, 85
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
