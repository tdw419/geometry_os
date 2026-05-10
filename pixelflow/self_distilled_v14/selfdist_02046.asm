; DESCRIPTION: Renders a blue line segment connecting (318, 29) to (329, 54).
; PLAN: r0=318(x1), r1=29(y1), r2=329(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 29
LDI r2, 329
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
