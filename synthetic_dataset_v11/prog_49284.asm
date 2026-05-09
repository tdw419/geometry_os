; DESCRIPTION: Places a purple 23x51 rectangle at position (138, 188).
; PLAN: r0=138(x), r1=188(y), r2=23(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 188
LDI r2, 23
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
