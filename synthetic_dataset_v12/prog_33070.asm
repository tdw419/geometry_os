; DESCRIPTION: Places a yellow line segment connecting (217, 191) to (222, 80).
; PLAN: r0=217(x1), r1=191(y1), r2=222(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 191
LDI r2, 222
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
