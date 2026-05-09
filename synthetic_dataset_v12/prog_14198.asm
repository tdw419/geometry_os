; DESCRIPTION: Places a purple line segment connecting (223, 19) to (186, 206).
; PLAN: r0=223(x1), r1=19(y1), r2=186(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 19
LDI r2, 186
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
