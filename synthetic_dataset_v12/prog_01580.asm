; DESCRIPTION: Renders a yellow line between points (48, 52) and (80, 148).
; PLAN: r0=48(x1), r1=52(y1), r2=80(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 52
LDI r2, 80
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
