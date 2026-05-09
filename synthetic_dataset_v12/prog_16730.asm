; DESCRIPTION: Places a purple 101x14 rectangle at position (5, 14).
; PLAN: r0=5(x), r1=14(y), r2=101(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 14
LDI r2, 101
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
