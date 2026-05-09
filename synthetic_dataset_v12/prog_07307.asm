; DESCRIPTION: Places a yellow line segment connecting (449, 122) to (335, 220).
; PLAN: r0=449(x1), r1=122(y1), r2=335(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 122
LDI r2, 335
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
