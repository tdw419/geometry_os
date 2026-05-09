; DESCRIPTION: Places a yellow line segment connecting (335, 225) to (134, 74).
; PLAN: r0=335(x1), r1=225(y1), r2=134(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 225
LDI r2, 134
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
