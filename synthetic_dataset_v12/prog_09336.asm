; DESCRIPTION: Places a purple 25x22 rectangle at position (483, 196).
; PLAN: r0=483(x), r1=196(y), r2=25(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 196
LDI r2, 25
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
