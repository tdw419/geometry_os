; DESCRIPTION: Places a red line segment connecting (51, 163) to (414, 94).
; PLAN: r0=51(x1), r1=163(y1), r2=414(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 163
LDI r2, 414
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
