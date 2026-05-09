; DESCRIPTION: Renders a magenta line between points (430, 124) and (451, 100).
; PLAN: r0=430(x1), r1=124(y1), r2=451(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 124
LDI r2, 451
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
