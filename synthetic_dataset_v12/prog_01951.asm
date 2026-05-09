; DESCRIPTION: Renders a red line between points (422, 156) and (478, 237).
; PLAN: r0=422(x1), r1=156(y1), r2=478(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 156
LDI r2, 478
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
