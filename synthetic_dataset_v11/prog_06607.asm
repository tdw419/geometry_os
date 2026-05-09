; DESCRIPTION: Draws a black line from (194, 51) to (162, 106).
; PLAN: r0=194(x1), r1=51(y1), r2=162(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 51
LDI r2, 162
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
