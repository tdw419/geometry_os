; DESCRIPTION: Renders a red line between points (57, 178) and (423, 159).
; PLAN: r0=57(x1), r1=178(y1), r2=423(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 178
LDI r2, 423
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
