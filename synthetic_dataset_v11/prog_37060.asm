; DESCRIPTION: Renders a yellow line between points (3, 80) and (145, 24).
; PLAN: r0=3(x1), r1=80(y1), r2=145(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 80
LDI r2, 145
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
