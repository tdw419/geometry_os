; DESCRIPTION: Places a magenta line segment connecting (153, 211) to (71, 168).
; PLAN: r0=153(x1), r1=211(y1), r2=71(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 211
LDI r2, 71
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
