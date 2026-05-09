; DESCRIPTION: Places a blue line segment connecting (186, 166) to (142, 130).
; PLAN: r0=186(x1), r1=166(y1), r2=142(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 166
LDI r2, 142
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
