; DESCRIPTION: Renders a yellow line between points (421, 240) and (89, 23).
; PLAN: r0=421(x1), r1=240(y1), r2=89(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 240
LDI r2, 89
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
