; DESCRIPTION: Places a red line segment connecting (51, 218) to (389, 171).
; PLAN: r0=51(x1), r1=218(y1), r2=389(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 218
LDI r2, 389
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
