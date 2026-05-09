; DESCRIPTION: Places a magenta line segment connecting (133, 177) to (242, 140).
; PLAN: r0=133(x1), r1=177(y1), r2=242(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 177
LDI r2, 242
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
