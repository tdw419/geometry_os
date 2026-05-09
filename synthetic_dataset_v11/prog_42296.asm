; DESCRIPTION: Places a purple 47x55 rectangle at position (201, 136).
; PLAN: r0=201(x), r1=136(y), r2=47(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 136
LDI r2, 47
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
