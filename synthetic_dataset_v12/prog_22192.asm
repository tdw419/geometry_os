; DESCRIPTION: Renders a red line between points (61, 7) and (161, 147).
; PLAN: r0=61(x1), r1=7(y1), r2=161(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 7
LDI r2, 161
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
