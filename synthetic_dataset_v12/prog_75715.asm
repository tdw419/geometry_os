; DESCRIPTION: Places a yellow line segment connecting (177, 122) to (200, 37).
; PLAN: r0=177(x1), r1=122(y1), r2=200(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 122
LDI r2, 200
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
