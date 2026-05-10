; DESCRIPTION: Renders a red line between points (51, 170) and (159, 94).
; PLAN: r0=51(x1), r1=170(y1), r2=159(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 170
LDI r2, 159
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
