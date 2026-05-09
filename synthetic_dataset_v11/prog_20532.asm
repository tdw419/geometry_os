; DESCRIPTION: Places a purple 104x72 rectangle at position (131, 22).
; PLAN: r0=131(x), r1=22(y), r2=104(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 22
LDI r2, 104
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
