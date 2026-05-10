; DESCRIPTION: Places a purple 110x118 rectangle at position (92, 63).
; PLAN: r0=92(x), r1=63(y), r2=110(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 63
LDI r2, 110
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
