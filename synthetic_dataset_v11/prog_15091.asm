; DESCRIPTION: Places a purple 120x14 rectangle at position (56, 89).
; PLAN: r0=56(x), r1=89(y), r2=120(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 89
LDI r2, 120
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
