; DESCRIPTION: Places a blue line segment connecting (251, 112) to (135, 5).
; PLAN: r0=251(x1), r1=112(y1), r2=135(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 112
LDI r2, 135
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
