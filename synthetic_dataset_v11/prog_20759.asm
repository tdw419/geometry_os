; DESCRIPTION: Places a purple 95x37 rectangle at position (155, 122).
; PLAN: r0=155(x), r1=122(y), r2=95(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 122
LDI r2, 95
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
