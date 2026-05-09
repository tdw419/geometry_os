; DESCRIPTION: Renders a yellow line between points (132, 240) and (80, 31).
; PLAN: r0=132(x1), r1=240(y1), r2=80(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 240
LDI r2, 80
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
