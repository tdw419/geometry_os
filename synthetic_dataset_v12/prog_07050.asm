; DESCRIPTION: Places a purple 110x62 rectangle at position (184, 88).
; PLAN: r0=184(x), r1=88(y), r2=110(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 88
LDI r2, 110
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
