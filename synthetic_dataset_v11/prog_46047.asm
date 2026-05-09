; DESCRIPTION: Renders a purple line between points (214, 219) and (247, 119).
; PLAN: r0=214(x1), r1=219(y1), r2=247(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 219
LDI r2, 247
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
