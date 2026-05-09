; DESCRIPTION: Places a yellow line segment connecting (191, 163) to (52, 238).
; PLAN: r0=191(x1), r1=163(y1), r2=52(x2), r3=238(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 163
LDI r2, 52
LDI r3, 238
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
