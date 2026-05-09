; DESCRIPTION: Renders a purple line between points (70, 123) and (500, 52).
; PLAN: r0=70(x1), r1=123(y1), r2=500(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 123
LDI r2, 500
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
