; DESCRIPTION: Places a purple 107x104 rectangle at position (20, 61).
; PLAN: r0=20(x), r1=61(y), r2=107(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 61
LDI r2, 107
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
