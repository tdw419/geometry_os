; DESCRIPTION: Places a blue line segment connecting (3, 124) to (51, 59).
; PLAN: r0=3(x1), r1=124(y1), r2=51(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 124
LDI r2, 51
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
