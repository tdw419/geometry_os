; DESCRIPTION: Places a white line segment connecting (369, 30) to (29, 185).
; PLAN: r0=369(x1), r1=30(y1), r2=29(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 30
LDI r2, 29
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
