; DESCRIPTION: Renders a magenta line between points (163, 40) and (142, 219).
; PLAN: r0=163(x1), r1=40(y1), r2=142(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 40
LDI r2, 142
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
