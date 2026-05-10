; DESCRIPTION: Renders a purple line between points (491, 25) and (130, 60).
; PLAN: r0=491(x1), r1=25(y1), r2=130(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 25
LDI r2, 130
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
