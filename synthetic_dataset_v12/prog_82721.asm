; DESCRIPTION: Renders a purple line between points (409, 160) and (0, 37).
; PLAN: r0=409(x1), r1=160(y1), r2=0(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 160
LDI r2, 0
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
