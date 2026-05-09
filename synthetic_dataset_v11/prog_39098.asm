; DESCRIPTION: Places a magenta line segment connecting (242, 69) to (147, 131).
; PLAN: r0=242(x1), r1=69(y1), r2=147(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 69
LDI r2, 147
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
