; DESCRIPTION: Places a yellow line segment connecting (9, 47) to (369, 40).
; PLAN: r0=9(x1), r1=47(y1), r2=369(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 47
LDI r2, 369
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
