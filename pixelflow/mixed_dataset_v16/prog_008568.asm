; DESCRIPTION: Places a yellow line segment connecting (37, 83) to (200, 69).
; PLAN: r0=37(x1), r1=83(y1), r2=200(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 83
LDI r2, 200
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
