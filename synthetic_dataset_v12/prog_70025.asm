; DESCRIPTION: Places a purple 88x101 rectangle at position (370, 85).
; PLAN: r0=370(x), r1=85(y), r2=88(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 85
LDI r2, 88
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
