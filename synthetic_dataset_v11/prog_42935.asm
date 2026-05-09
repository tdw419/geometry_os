; DESCRIPTION: Places a yellow line segment connecting (178, 203) to (22, 200).
; PLAN: r0=178(x1), r1=203(y1), r2=22(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 203
LDI r2, 22
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
