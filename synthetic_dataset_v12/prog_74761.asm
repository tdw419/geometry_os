; DESCRIPTION: Renders a blue line between points (363, 38) and (417, 232).
; PLAN: r0=363(x1), r1=38(y1), r2=417(x2), r3=232(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 38
LDI r2, 417
LDI r3, 232
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
