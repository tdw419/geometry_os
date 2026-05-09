; DESCRIPTION: Places a purple 13x100 rectangle at position (251, 145).
; PLAN: r0=251(x), r1=145(y), r2=13(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 145
LDI r2, 13
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
