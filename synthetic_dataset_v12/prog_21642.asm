; DESCRIPTION: Draws a purple line from (410, 26) to (51, 22).
; PLAN: r0=410(x1), r1=26(y1), r2=51(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 26
LDI r2, 51
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
