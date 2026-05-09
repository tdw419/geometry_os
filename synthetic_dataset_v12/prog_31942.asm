; DESCRIPTION: Places a yellow line segment connecting (442, 225) to (416, 147).
; PLAN: r0=442(x1), r1=225(y1), r2=416(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 225
LDI r2, 416
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
