; DESCRIPTION: Draws a purple line from (425, 160) to (241, 112).
; PLAN: r0=425(x1), r1=160(y1), r2=241(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 160
LDI r2, 241
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
