; DESCRIPTION: Renders a yellow line between points (48, 40) and (369, 84).
; PLAN: r0=48(x1), r1=40(y1), r2=369(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 40
LDI r2, 369
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
