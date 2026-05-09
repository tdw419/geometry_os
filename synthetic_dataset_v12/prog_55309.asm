; DESCRIPTION: Renders a purple line between points (340, 219) and (185, 46).
; PLAN: r0=340(x1), r1=219(y1), r2=185(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 219
LDI r2, 185
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
