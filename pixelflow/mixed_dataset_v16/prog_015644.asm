; DESCRIPTION: Places a magenta line segment connecting (185, 54) to (478, 88).
; PLAN: r0=185(x1), r1=54(y1), r2=478(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 54
LDI r2, 478
LDI r3, 88
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
