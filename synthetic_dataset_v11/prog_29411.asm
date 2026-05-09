; DESCRIPTION: Places a magenta line segment connecting (91, 26) to (254, 112).
; PLAN: r0=91(x1), r1=26(y1), r2=254(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 26
LDI r2, 254
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
