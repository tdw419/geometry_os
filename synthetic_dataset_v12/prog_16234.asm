; DESCRIPTION: Renders a red line between points (484, 7) and (395, 131).
; PLAN: r0=484(x1), r1=7(y1), r2=395(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 7
LDI r2, 395
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
