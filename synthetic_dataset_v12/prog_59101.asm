; DESCRIPTION: Places a purple 62x37 rectangle at position (223, 158).
; PLAN: r0=223(x), r1=158(y), r2=62(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 158
LDI r2, 62
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
