; DESCRIPTION: Places a purple 64x117 rectangle at position (6, 81).
; PLAN: r0=6(x), r1=81(y), r2=64(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 81
LDI r2, 64
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
