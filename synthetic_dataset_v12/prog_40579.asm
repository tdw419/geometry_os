; DESCRIPTION: Renders a magenta line between points (351, 110) and (357, 182).
; PLAN: r0=351(x1), r1=110(y1), r2=357(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 110
LDI r2, 357
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
