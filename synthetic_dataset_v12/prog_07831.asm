; DESCRIPTION: Places a yellow line segment connecting (306, 64) to (389, 17).
; PLAN: r0=306(x1), r1=64(y1), r2=389(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 64
LDI r2, 389
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
