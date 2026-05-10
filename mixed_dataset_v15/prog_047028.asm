; DESCRIPTION: Places a magenta line segment connecting (147, 39) to (143, 130).
; PLAN: r0=147(x1), r1=39(y1), r2=143(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 39
LDI r2, 143
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
