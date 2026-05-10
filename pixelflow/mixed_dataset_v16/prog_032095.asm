; DESCRIPTION: Renders a purple line between points (164, 0) and (430, 227).
; PLAN: r0=164(x1), r1=0(y1), r2=430(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 0
LDI r2, 430
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
