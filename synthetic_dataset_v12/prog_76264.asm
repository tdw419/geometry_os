; DESCRIPTION: Renders a purple line between points (291, 185) and (283, 131).
; PLAN: r0=291(x1), r1=185(y1), r2=283(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 185
LDI r2, 283
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
