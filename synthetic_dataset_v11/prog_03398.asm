; DESCRIPTION: Places a purple 57x49 rectangle at position (12, 128).
; PLAN: r0=12(x), r1=128(y), r2=57(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 128
LDI r2, 57
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
