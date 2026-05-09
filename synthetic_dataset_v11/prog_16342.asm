; DESCRIPTION: Renders a magenta line between points (147, 57) and (17, 33).
; PLAN: r0=147(x1), r1=57(y1), r2=17(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 57
LDI r2, 17
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
