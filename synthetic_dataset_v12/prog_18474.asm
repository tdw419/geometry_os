; DESCRIPTION: Places a yellow line segment connecting (140, 17) to (307, 124).
; PLAN: r0=140(x1), r1=17(y1), r2=307(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 17
LDI r2, 307
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
