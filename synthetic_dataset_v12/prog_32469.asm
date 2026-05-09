; DESCRIPTION: Renders a purple line between points (409, 236) and (474, 4).
; PLAN: r0=409(x1), r1=236(y1), r2=474(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 236
LDI r2, 474
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
