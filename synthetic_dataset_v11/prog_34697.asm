; DESCRIPTION: Renders a yellow line between points (232, 80) and (135, 168).
; PLAN: r0=232(x1), r1=80(y1), r2=135(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 80
LDI r2, 135
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
