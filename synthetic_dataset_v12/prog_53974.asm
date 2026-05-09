; DESCRIPTION: Places a blue line segment connecting (137, 211) to (416, 229).
; PLAN: r0=137(x1), r1=211(y1), r2=416(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 211
LDI r2, 416
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
