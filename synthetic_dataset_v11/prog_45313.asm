; DESCRIPTION: Places a purple line segment connecting (104, 211) to (237, 149).
; PLAN: r0=104(x1), r1=211(y1), r2=237(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 211
LDI r2, 237
LDI r3, 149
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
