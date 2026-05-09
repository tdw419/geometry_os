; DESCRIPTION: Draws a purple line from (218, 172) to (51, 99).
; PLAN: r0=218(x1), r1=172(y1), r2=51(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 172
LDI r2, 51
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
