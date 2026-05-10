; DESCRIPTION: Places a purple 16x49 rectangle at position (379, 13).
; PLAN: r0=379(x), r1=13(y), r2=16(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 13
LDI r2, 16
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
