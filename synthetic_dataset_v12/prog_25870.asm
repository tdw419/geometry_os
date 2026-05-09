; DESCRIPTION: Renders a black line between points (190, 89) and (292, 108).
; PLAN: r0=190(x1), r1=89(y1), r2=292(x2), r3=108(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 89
LDI r2, 292
LDI r3, 108
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
