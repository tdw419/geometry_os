; DESCRIPTION: Places a purple 109x48 rectangle at position (89, 170).
; PLAN: r0=89(x), r1=170(y), r2=109(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 170
LDI r2, 109
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
