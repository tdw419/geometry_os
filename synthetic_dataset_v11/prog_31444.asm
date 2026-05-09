; DESCRIPTION: Places a purple 106x101 rectangle at position (17, 49).
; PLAN: r0=17(x), r1=49(y), r2=106(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 49
LDI r2, 106
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
