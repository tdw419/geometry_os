; DESCRIPTION: Places a purple 34x88 box at position (49, 184).
; PLAN: r0=49(x), r1=184(y), r2=34(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 184
LDI r2, 34
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
