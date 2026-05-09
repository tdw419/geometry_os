; DESCRIPTION: Renders a green line between points (163, 54) and (36, 160).
; PLAN: r0=163(x1), r1=54(y1), r2=36(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 54
LDI r2, 36
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
