; DESCRIPTION: Draws a red line from (163, 3) to (51, 33).
; PLAN: r0=163(x1), r1=3(y1), r2=51(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 3
LDI r2, 51
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
