; DESCRIPTION: Places a purple 14x104 rectangle at position (99, 133).
; PLAN: r0=99(x), r1=133(y), r2=14(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 133
LDI r2, 14
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
