; DESCRIPTION: Places a magenta line segment connecting (56, 127) to (129, 69).
; PLAN: r0=56(x1), r1=127(y1), r2=129(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 127
LDI r2, 129
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
