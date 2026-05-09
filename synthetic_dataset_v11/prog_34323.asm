; DESCRIPTION: Renders a red line between points (57, 217) and (159, 254).
; PLAN: r0=57(x1), r1=217(y1), r2=159(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 217
LDI r2, 159
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
