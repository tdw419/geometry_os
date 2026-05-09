; DESCRIPTION: Places a purple line segment connecting (69, 31) to (225, 99).
; PLAN: r0=69(x1), r1=31(y1), r2=225(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 31
LDI r2, 225
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
