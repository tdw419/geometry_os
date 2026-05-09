; DESCRIPTION: Places a red line segment connecting (130, 2) to (250, 99).
; PLAN: r0=130(x1), r1=2(y1), r2=250(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 2
LDI r2, 250
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
