; DESCRIPTION: Places a purple 35x69 rectangle at position (89, 66).
; PLAN: r0=89(x), r1=66(y), r2=35(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 66
LDI r2, 35
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
