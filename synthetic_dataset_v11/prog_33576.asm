; DESCRIPTION: Renders a purple line between points (159, 130) and (5, 162).
; PLAN: r0=159(x1), r1=130(y1), r2=5(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 130
LDI r2, 5
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
