; DESCRIPTION: Draws a purple line from (36, 132) to (238, 112).
; PLAN: r0=36(x1), r1=132(y1), r2=238(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 132
LDI r2, 238
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
