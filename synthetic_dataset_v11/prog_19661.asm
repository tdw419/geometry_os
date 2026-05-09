; DESCRIPTION: Places a blue line segment connecting (112, 65) to (135, 196).
; PLAN: r0=112(x1), r1=65(y1), r2=135(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 65
LDI r2, 135
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
