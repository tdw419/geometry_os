; DESCRIPTION: Places a red line segment connecting (90, 51) to (189, 71).
; PLAN: r0=90(x1), r1=51(y1), r2=189(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 51
LDI r2, 189
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
