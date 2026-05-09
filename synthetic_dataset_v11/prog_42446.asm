; DESCRIPTION: Places a yellow line segment connecting (203, 161) to (119, 100).
; PLAN: r0=203(x1), r1=161(y1), r2=119(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 161
LDI r2, 119
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
