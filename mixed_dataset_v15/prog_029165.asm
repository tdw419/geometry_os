; DESCRIPTION: Renders a yellow line between points (65, 7) and (369, 131).
; PLAN: r0=65(x1), r1=7(y1), r2=369(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 7
LDI r2, 369
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
