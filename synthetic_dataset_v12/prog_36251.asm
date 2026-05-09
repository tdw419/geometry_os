; DESCRIPTION: Places a yellow line segment connecting (8, 57) to (111, 196).
; PLAN: r0=8(x1), r1=57(y1), r2=111(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 57
LDI r2, 111
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
