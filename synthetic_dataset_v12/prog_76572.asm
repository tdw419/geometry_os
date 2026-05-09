; DESCRIPTION: Places a purple 93x66 rectangle at position (117, 110).
; PLAN: r0=117(x), r1=110(y), r2=93(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 110
LDI r2, 93
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
