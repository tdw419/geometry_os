; DESCRIPTION: Places a purple line segment connecting (163, 68) to (29, 174).
; PLAN: r0=163(x1), r1=68(y1), r2=29(x2), r3=174(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 68
LDI r2, 29
LDI r3, 174
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
