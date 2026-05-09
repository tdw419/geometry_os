; DESCRIPTION: Places a purple 68x96 rectangle at position (51, 145).
; PLAN: r0=51(x), r1=145(y), r2=68(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 145
LDI r2, 68
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
