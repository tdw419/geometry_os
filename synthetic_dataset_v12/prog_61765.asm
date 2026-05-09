; DESCRIPTION: Places a green line segment connecting (369, 105) to (44, 62).
; PLAN: r0=369(x1), r1=105(y1), r2=44(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 105
LDI r2, 44
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
