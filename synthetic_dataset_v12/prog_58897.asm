; DESCRIPTION: Places a purple line segment connecting (402, 186) to (218, 38).
; PLAN: r0=402(x1), r1=186(y1), r2=218(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 186
LDI r2, 218
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
