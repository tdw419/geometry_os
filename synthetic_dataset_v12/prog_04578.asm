; DESCRIPTION: Renders a red line between points (36, 80) and (349, 161).
; PLAN: r0=36(x1), r1=80(y1), r2=349(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 80
LDI r2, 349
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
