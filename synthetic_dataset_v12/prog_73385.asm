; DESCRIPTION: Places a purple 20x68 rectangle at position (32, 73).
; PLAN: r0=32(x), r1=73(y), r2=20(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 73
LDI r2, 20
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
