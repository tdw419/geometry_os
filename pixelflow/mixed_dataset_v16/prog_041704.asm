; DESCRIPTION: Draws a purple line from (511, 96) to (40, 191).
; PLAN: r0=511(x1), r1=96(y1), r2=40(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 96
LDI r2, 40
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
