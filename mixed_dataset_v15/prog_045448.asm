; DESCRIPTION: Renders a purple line between points (500, 211) and (29, 164).
; PLAN: r0=500(x1), r1=211(y1), r2=29(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 211
LDI r2, 29
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
