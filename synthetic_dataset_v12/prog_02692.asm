; DESCRIPTION: Places a magenta line segment connecting (496, 60) to (205, 141).
; PLAN: r0=496(x1), r1=60(y1), r2=205(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 60
LDI r2, 205
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
