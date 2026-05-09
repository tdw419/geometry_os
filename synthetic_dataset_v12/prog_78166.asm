; DESCRIPTION: Renders a red line between points (466, 31) and (422, 217).
; PLAN: r0=466(x1), r1=31(y1), r2=422(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 31
LDI r2, 422
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
