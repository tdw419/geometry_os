; DESCRIPTION: Places a purple 15x104 rectangle at position (134, 88).
; PLAN: r0=134(x), r1=88(y), r2=15(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 88
LDI r2, 15
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
