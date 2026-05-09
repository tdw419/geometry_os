; DESCRIPTION: Places a yellow line segment connecting (194, 231) to (115, 155).
; PLAN: r0=194(x1), r1=231(y1), r2=115(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 231
LDI r2, 115
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
