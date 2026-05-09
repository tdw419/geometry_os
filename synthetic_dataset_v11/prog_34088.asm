; DESCRIPTION: Places a blue line segment connecting (20, 217) to (51, 120).
; PLAN: r0=20(x1), r1=217(y1), r2=51(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 217
LDI r2, 51
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
