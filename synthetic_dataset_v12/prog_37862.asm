; DESCRIPTION: Draws a red line from (395, 95) to (77, 112).
; PLAN: r0=395(x1), r1=95(y1), r2=77(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 95
LDI r2, 77
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
