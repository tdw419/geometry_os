; DESCRIPTION: Places a purple 88x24 rectangle at position (147, 43).
; PLAN: r0=147(x), r1=43(y), r2=88(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 43
LDI r2, 88
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
