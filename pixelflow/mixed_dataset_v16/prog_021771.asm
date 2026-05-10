; DESCRIPTION: Places a purple 49x42 rectangle at position (236, 74).
; PLAN: r0=236(x), r1=74(y), r2=49(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 74
LDI r2, 49
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
