; DESCRIPTION: Renders a red line between points (355, 248) and (430, 238).
; PLAN: r0=355(x1), r1=248(y1), r2=430(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 248
LDI r2, 430
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
