; DESCRIPTION: Places a magenta line segment connecting (241, 23) to (407, 141).
; PLAN: r0=241(x1), r1=23(y1), r2=407(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 23
LDI r2, 407
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
