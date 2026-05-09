; DESCRIPTION: Places a purple line segment connecting (398, 188) to (290, 211).
; PLAN: r0=398(x1), r1=188(y1), r2=290(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 188
LDI r2, 290
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
