; DESCRIPTION: Places a purple 14x31 rectangle at position (33, 145).
; PLAN: r0=33(x), r1=145(y), r2=14(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 145
LDI r2, 14
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
