; DESCRIPTION: Places a purple 64x96 rectangle at position (123, 158).
; PLAN: r0=123(x), r1=158(y), r2=64(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 158
LDI r2, 64
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
