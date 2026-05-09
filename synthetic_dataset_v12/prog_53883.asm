; DESCRIPTION: Draws a red line from (478, 41) to (260, 238).
; PLAN: r0=478(x1), r1=41(y1), r2=260(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 41
LDI r2, 260
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
