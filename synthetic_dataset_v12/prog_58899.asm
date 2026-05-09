; DESCRIPTION: Renders a red line between points (314, 23) and (422, 225).
; PLAN: r0=314(x1), r1=23(y1), r2=422(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 23
LDI r2, 422
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
