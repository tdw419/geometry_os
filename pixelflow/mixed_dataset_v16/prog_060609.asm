; DESCRIPTION: Places a yellow line segment connecting (111, 196) to (65, 89).
; PLAN: r0=111(x1), r1=196(y1), r2=65(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 196
LDI r2, 65
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
