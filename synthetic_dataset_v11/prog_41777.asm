; DESCRIPTION: Places a purple 17x115 rectangle at position (26, 122).
; PLAN: r0=26(x), r1=122(y), r2=17(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 122
LDI r2, 17
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
