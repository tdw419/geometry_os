; DESCRIPTION: Places a yellow line segment connecting (233, 130) to (89, 165).
; PLAN: r0=233(x1), r1=130(y1), r2=89(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 130
LDI r2, 89
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
