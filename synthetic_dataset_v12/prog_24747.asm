; DESCRIPTION: Places a magenta line segment connecting (209, 88) to (136, 145).
; PLAN: r0=209(x1), r1=88(y1), r2=136(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 88
LDI r2, 136
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
