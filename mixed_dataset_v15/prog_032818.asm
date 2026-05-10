; DESCRIPTION: Renders a purple line between points (98, 19) and (282, 200).
; PLAN: r0=98(x1), r1=19(y1), r2=282(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 19
LDI r2, 282
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
