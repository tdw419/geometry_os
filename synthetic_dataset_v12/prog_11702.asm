; DESCRIPTION: Draws a red line from (263, 34) to (51, 35).
; PLAN: r0=263(x1), r1=34(y1), r2=51(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 34
LDI r2, 51
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
