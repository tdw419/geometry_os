; DESCRIPTION: Places a purple 33x88 rectangle at position (179, 159).
; PLAN: r0=179(x), r1=159(y), r2=33(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 159
LDI r2, 33
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
