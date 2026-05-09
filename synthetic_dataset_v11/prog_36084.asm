; DESCRIPTION: Places a magenta line segment connecting (191, 71) to (31, 96).
; PLAN: r0=191(x1), r1=71(y1), r2=31(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 71
LDI r2, 31
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
