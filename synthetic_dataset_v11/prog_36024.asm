; DESCRIPTION: Places a purple 54x85 rectangle at position (179, 147).
; PLAN: r0=179(x), r1=147(y), r2=54(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 147
LDI r2, 54
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
