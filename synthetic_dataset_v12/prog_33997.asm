; DESCRIPTION: Renders a red line between points (355, 145) and (356, 45).
; PLAN: r0=355(x1), r1=145(y1), r2=356(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 145
LDI r2, 356
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
