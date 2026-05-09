; DESCRIPTION: Renders a green line between points (314, 99) and (2, 33).
; PLAN: r0=314(x1), r1=99(y1), r2=2(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 99
LDI r2, 2
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
