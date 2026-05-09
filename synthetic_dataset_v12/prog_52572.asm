; DESCRIPTION: Places a yellow line segment connecting (438, 163) to (369, 16).
; PLAN: r0=438(x1), r1=163(y1), r2=369(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 163
LDI r2, 369
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
