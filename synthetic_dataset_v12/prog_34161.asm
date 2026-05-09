; DESCRIPTION: Renders a green line between points (163, 68) and (89, 56).
; PLAN: r0=163(x1), r1=68(y1), r2=89(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 68
LDI r2, 89
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
