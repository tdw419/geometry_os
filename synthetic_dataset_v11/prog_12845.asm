; DESCRIPTION: Places a orange line segment connecting (124, 200) to (240, 44).
; PLAN: r0=124(x1), r1=200(y1), r2=240(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 200
LDI r2, 240
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
