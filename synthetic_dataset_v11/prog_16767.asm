; DESCRIPTION: Places a magenta line segment connecting (208, 54) to (112, 8).
; PLAN: r0=208(x1), r1=54(y1), r2=112(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 54
LDI r2, 112
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
