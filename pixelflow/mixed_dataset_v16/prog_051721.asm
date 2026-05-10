; DESCRIPTION: Places a purple 89x92 rectangle at position (270, 45).
; PLAN: r0=270(x), r1=45(y), r2=89(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 45
LDI r2, 89
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
