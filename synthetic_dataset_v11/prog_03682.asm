; DESCRIPTION: Places a magenta line segment connecting (63, 145) to (9, 138).
; PLAN: r0=63(x1), r1=145(y1), r2=9(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 145
LDI r2, 9
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
