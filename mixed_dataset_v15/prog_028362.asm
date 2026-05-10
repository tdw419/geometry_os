; DESCRIPTION: Places a purple 81x100 rectangle at position (233, 110).
; PLAN: r0=233(x), r1=110(y), r2=81(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 110
LDI r2, 81
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
