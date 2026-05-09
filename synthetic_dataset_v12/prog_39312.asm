; DESCRIPTION: Places a magenta line segment connecting (242, 153) to (471, 140).
; PLAN: r0=242(x1), r1=153(y1), r2=471(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 153
LDI r2, 471
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
