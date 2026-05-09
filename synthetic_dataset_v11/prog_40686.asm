; DESCRIPTION: Places a magenta line segment connecting (102, 69) to (185, 22).
; PLAN: r0=102(x1), r1=69(y1), r2=185(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 69
LDI r2, 185
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
