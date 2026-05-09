; DESCRIPTION: Renders a red line between points (402, 177) and (422, 212).
; PLAN: r0=402(x1), r1=177(y1), r2=422(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 177
LDI r2, 422
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
