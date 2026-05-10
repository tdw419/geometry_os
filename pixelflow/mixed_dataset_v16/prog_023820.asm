; DESCRIPTION: Renders a yellow line between points (369, 47) and (197, 81).
; PLAN: r0=369(x1), r1=47(y1), r2=197(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 47
LDI r2, 197
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
