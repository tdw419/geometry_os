; DESCRIPTION: Places a magenta line segment connecting (169, 114) to (180, 242).
; PLAN: r0=169(x1), r1=114(y1), r2=180(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 114
LDI r2, 180
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
