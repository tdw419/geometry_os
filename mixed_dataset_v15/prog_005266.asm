; DESCRIPTION: Places a green line segment connecting (283, 124) to (369, 58).
; PLAN: r0=283(x1), r1=124(y1), r2=369(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 124
LDI r2, 369
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
