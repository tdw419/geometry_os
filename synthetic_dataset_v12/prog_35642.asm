; DESCRIPTION: Places a purple line segment connecting (424, 177) to (254, 205).
; PLAN: r0=424(x1), r1=177(y1), r2=254(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 177
LDI r2, 254
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
