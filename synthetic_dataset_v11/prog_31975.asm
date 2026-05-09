; DESCRIPTION: Places a purple 74x79 rectangle at position (128, 170).
; PLAN: r0=128(x), r1=170(y), r2=74(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 170
LDI r2, 74
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
