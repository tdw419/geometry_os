; DESCRIPTION: Places a purple 49x114 rectangle at position (25, 76).
; PLAN: r0=25(x), r1=76(y), r2=49(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 76
LDI r2, 49
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
