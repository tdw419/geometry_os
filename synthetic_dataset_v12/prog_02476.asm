; DESCRIPTION: Renders a red line between points (323, 131) and (37, 46).
; PLAN: r0=323(x1), r1=131(y1), r2=37(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 131
LDI r2, 37
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
