; DESCRIPTION: Draws a purple line from (96, 18) to (249, 112).
; PLAN: r0=96(x1), r1=18(y1), r2=249(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 18
LDI r2, 249
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
