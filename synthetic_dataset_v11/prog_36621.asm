; DESCRIPTION: Draws a yellow line from (158, 51) to (229, 73).
; PLAN: r0=158(x1), r1=51(y1), r2=229(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 51
LDI r2, 229
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
