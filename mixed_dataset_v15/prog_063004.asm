; DESCRIPTION: Places a purple 64x114 rectangle at position (104, 87).
; PLAN: r0=104(x), r1=87(y), r2=64(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 87
LDI r2, 64
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
