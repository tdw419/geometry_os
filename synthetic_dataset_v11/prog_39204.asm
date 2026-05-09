; DESCRIPTION: Renders a red line between points (201, 7) and (0, 225).
; PLAN: r0=201(x1), r1=7(y1), r2=0(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 7
LDI r2, 0
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
