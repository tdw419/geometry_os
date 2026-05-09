; DESCRIPTION: Places a magenta line segment connecting (31, 82) to (169, 193).
; PLAN: r0=31(x1), r1=82(y1), r2=169(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 82
LDI r2, 169
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
