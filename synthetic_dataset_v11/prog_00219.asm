; DESCRIPTION: Places a purple 64x105 rectangle at position (3, 35).
; PLAN: r0=3(x), r1=35(y), r2=64(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 35
LDI r2, 64
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
