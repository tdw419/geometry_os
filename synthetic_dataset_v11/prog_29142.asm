; DESCRIPTION: Places a yellow line segment connecting (130, 156) to (72, 14).
; PLAN: r0=130(x1), r1=156(y1), r2=72(x2), r3=14(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 156
LDI r2, 72
LDI r3, 14
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
