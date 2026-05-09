; DESCRIPTION: Renders a purple line between points (130, 187) and (244, 200).
; PLAN: r0=130(x1), r1=187(y1), r2=244(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 187
LDI r2, 244
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
