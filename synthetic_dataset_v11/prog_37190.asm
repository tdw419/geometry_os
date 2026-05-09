; DESCRIPTION: Places a yellow line segment connecting (7, 119) to (16, 144).
; PLAN: r0=7(x1), r1=119(y1), r2=16(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 119
LDI r2, 16
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
