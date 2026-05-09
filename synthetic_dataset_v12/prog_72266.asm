; DESCRIPTION: Renders a red line between points (73, 52) and (223, 34).
; PLAN: r0=73(x1), r1=52(y1), r2=223(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 52
LDI r2, 223
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
