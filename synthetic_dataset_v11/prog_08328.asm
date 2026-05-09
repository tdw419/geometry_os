; DESCRIPTION: Places a purple 79x72 rectangle at position (128, 62).
; PLAN: r0=128(x), r1=62(y), r2=79(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 62
LDI r2, 79
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
