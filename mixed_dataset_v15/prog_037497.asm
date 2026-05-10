; DESCRIPTION: Places a yellow line segment connecting (68, 111) to (430, 130).
; PLAN: r0=68(x1), r1=111(y1), r2=430(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 111
LDI r2, 430
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
