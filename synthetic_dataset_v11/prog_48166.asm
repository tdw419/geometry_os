; DESCRIPTION: Places a yellow line segment connecting (80, 254) to (169, 189).
; PLAN: r0=80(x1), r1=254(y1), r2=169(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 254
LDI r2, 169
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
