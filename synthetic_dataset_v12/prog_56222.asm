; DESCRIPTION: Renders a purple line between points (4, 130) and (459, 161).
; PLAN: r0=4(x1), r1=130(y1), r2=459(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 130
LDI r2, 459
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
