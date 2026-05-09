; DESCRIPTION: Draws a red line from (317, 62) to (169, 100).
; PLAN: r0=317(x1), r1=62(y1), r2=169(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 62
LDI r2, 169
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
