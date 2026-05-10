; DESCRIPTION: Renders a red line between points (176, 28) and (432, 238).
; PLAN: r0=176(x1), r1=28(y1), r2=432(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 28
LDI r2, 432
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
