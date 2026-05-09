; DESCRIPTION: Places a green line segment connecting (58, 198) to (204, 155).
; PLAN: r0=58(x1), r1=198(y1), r2=204(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 198
LDI r2, 204
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
