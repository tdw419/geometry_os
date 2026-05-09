; DESCRIPTION: Places a purple line segment connecting (55, 117) to (112, 6).
; PLAN: r0=55(x1), r1=117(y1), r2=112(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 117
LDI r2, 112
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
