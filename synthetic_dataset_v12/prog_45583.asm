; DESCRIPTION: Renders a purple line between points (200, 170) and (329, 193).
; PLAN: r0=200(x1), r1=170(y1), r2=329(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 170
LDI r2, 329
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
