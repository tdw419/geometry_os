; DESCRIPTION: Places a purple 118x109 rectangle at position (116, 110).
; PLAN: r0=116(x), r1=110(y), r2=118(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 110
LDI r2, 118
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
