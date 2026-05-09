; DESCRIPTION: Renders a yellow line between points (56, 13) and (369, 93).
; PLAN: r0=56(x1), r1=13(y1), r2=369(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 13
LDI r2, 369
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
