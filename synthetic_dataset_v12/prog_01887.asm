; DESCRIPTION: Places a purple 49x13 rectangle at position (35, 101).
; PLAN: r0=35(x), r1=101(y), r2=49(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 101
LDI r2, 49
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
