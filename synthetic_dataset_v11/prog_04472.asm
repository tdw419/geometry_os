; DESCRIPTION: Places a yellow line segment connecting (112, 13) to (50, 109).
; PLAN: r0=112(x1), r1=13(y1), r2=50(x2), r3=109(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 13
LDI r2, 50
LDI r3, 109
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
