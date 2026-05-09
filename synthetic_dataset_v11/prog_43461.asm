; DESCRIPTION: Places a purple 19x69 rectangle at position (62, 149).
; PLAN: r0=62(x), r1=149(y), r2=19(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 149
LDI r2, 19
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
