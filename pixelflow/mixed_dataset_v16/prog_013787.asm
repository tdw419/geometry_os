; DESCRIPTION: Places a yellow line segment connecting (221, 185) to (37, 17).
; PLAN: r0=221(x1), r1=185(y1), r2=37(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 185
LDI r2, 37
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
