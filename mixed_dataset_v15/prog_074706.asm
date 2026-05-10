; DESCRIPTION: Places a magenta line segment connecting (381, 161) to (127, 211).
; PLAN: r0=381(x1), r1=161(y1), r2=127(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 161
LDI r2, 127
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
