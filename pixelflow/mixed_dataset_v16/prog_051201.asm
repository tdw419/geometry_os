; DESCRIPTION: Places a yellow line segment connecting (102, 130) to (273, 23).
; PLAN: r0=102(x1), r1=130(y1), r2=273(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 130
LDI r2, 273
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
