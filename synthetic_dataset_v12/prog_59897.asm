; DESCRIPTION: Places a blue line segment connecting (416, 169) to (300, 176).
; PLAN: r0=416(x1), r1=169(y1), r2=300(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 169
LDI r2, 300
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
