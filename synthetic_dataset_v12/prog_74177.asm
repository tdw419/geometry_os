; DESCRIPTION: Places a purple 11x35 rectangle at position (147, 119).
; PLAN: r0=147(x), r1=119(y), r2=11(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 119
LDI r2, 11
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
