; DESCRIPTION: Places a yellow line segment connecting (72, 143) to (115, 130).
; PLAN: r0=72(x1), r1=143(y1), r2=115(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 143
LDI r2, 115
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
