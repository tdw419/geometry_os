; DESCRIPTION: Places a magenta line segment connecting (241, 56) to (302, 177).
; PLAN: r0=241(x1), r1=56(y1), r2=302(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 56
LDI r2, 302
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
