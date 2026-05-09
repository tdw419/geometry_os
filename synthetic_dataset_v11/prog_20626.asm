; DESCRIPTION: Places a purple line segment connecting (99, 8) to (70, 55).
; PLAN: r0=99(x1), r1=8(y1), r2=70(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 8
LDI r2, 70
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
