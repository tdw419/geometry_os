; DESCRIPTION: Renders a magenta line between points (179, 145) and (112, 46).
; PLAN: r0=179(x1), r1=145(y1), r2=112(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 145
LDI r2, 112
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
