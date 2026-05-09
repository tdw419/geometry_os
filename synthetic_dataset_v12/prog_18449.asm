; DESCRIPTION: Places a blue line segment connecting (130, 87) to (318, 12).
; PLAN: r0=130(x1), r1=87(y1), r2=318(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 87
LDI r2, 318
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
