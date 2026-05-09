; DESCRIPTION: Renders a yellow line between points (163, 66) and (130, 27).
; PLAN: r0=163(x1), r1=66(y1), r2=130(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 66
LDI r2, 130
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
