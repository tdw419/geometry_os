; DESCRIPTION: Places a blue line segment connecting (74, 40) to (373, 51).
; PLAN: r0=74(x1), r1=40(y1), r2=373(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 40
LDI r2, 373
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
