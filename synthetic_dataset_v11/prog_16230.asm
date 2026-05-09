; DESCRIPTION: Places a purple 114x12 rectangle at position (128, 121).
; PLAN: r0=128(x), r1=121(y), r2=114(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 121
LDI r2, 114
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
