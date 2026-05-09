; DESCRIPTION: Places a magenta line segment connecting (246, 77) to (234, 208).
; PLAN: r0=246(x1), r1=77(y1), r2=234(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 77
LDI r2, 234
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
