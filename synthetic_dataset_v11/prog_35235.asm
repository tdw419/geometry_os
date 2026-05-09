; DESCRIPTION: Places a green line segment connecting (110, 13) to (109, 0).
; PLAN: r0=110(x1), r1=13(y1), r2=109(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 13
LDI r2, 109
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
