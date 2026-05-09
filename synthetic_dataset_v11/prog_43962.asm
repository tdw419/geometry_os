; DESCRIPTION: Places a yellow line segment connecting (188, 13) to (99, 75).
; PLAN: r0=188(x1), r1=13(y1), r2=99(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 13
LDI r2, 99
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
