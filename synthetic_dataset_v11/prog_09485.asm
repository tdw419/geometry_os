; DESCRIPTION: Places a purple 76x55 rectangle at position (179, 74).
; PLAN: r0=179(x), r1=74(y), r2=76(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 74
LDI r2, 76
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
