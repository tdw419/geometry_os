; DESCRIPTION: Renders a magenta line between points (147, 40) and (419, 46).
; PLAN: r0=147(x1), r1=40(y1), r2=419(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 40
LDI r2, 419
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
