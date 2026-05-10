; DESCRIPTION: Places a yellow line segment connecting (406, 232) to (306, 227).
; PLAN: r0=406(x1), r1=232(y1), r2=306(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 232
LDI r2, 306
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
