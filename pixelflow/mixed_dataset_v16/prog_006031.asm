; DESCRIPTION: Draws a purple line from (459, 71) to (496, 72).
; PLAN: r0=459(x1), r1=71(y1), r2=496(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 71
LDI r2, 496
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
