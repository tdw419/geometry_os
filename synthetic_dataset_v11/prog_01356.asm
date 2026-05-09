; DESCRIPTION: Places a yellow line segment connecting (160, 106) to (109, 0).
; PLAN: r0=160(x1), r1=106(y1), r2=109(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 106
LDI r2, 109
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
