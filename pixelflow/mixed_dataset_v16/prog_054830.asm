; DESCRIPTION: Places a yellow line segment connecting (130, 68) to (156, 33).
; PLAN: r0=130(x1), r1=68(y1), r2=156(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 68
LDI r2, 156
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
