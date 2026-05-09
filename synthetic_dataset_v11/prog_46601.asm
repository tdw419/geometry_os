; DESCRIPTION: Places a magenta line segment connecting (230, 88) to (112, 209).
; PLAN: r0=230(x1), r1=88(y1), r2=112(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 88
LDI r2, 112
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
