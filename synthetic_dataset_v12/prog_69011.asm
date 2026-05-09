; DESCRIPTION: Renders a purple line between points (409, 64) and (218, 211).
; PLAN: r0=409(x1), r1=64(y1), r2=218(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 64
LDI r2, 218
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
