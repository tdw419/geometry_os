; DESCRIPTION: Renders a red line between points (398, 66) and (159, 217).
; PLAN: r0=398(x1), r1=66(y1), r2=159(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 66
LDI r2, 159
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
