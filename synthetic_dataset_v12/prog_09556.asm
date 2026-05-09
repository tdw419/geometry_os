; DESCRIPTION: Renders a red line between points (131, 98) and (159, 155).
; PLAN: r0=131(x1), r1=98(y1), r2=159(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 98
LDI r2, 159
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
