; DESCRIPTION: Draws a purple line from (356, 74) to (496, 10).
; PLAN: r0=356(x1), r1=74(y1), r2=496(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 74
LDI r2, 496
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
