; DESCRIPTION: Places a yellow line segment connecting (106, 1) to (124, 84).
; PLAN: r0=106(x1), r1=1(y1), r2=124(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 1
LDI r2, 124
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
