; DESCRIPTION: Renders a purple line between points (205, 12) and (422, 186).
; PLAN: r0=205(x1), r1=12(y1), r2=422(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 12
LDI r2, 422
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
