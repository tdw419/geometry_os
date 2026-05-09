; DESCRIPTION: Places a purple 31x18 rectangle at position (440, 58).
; PLAN: r0=440(x), r1=58(y), r2=31(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 58
LDI r2, 31
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
