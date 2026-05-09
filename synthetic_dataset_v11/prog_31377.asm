; DESCRIPTION: Places a magenta line segment connecting (195, 87) to (129, 211).
; PLAN: r0=195(x1), r1=87(y1), r2=129(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 87
LDI r2, 129
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
