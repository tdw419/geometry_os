; DESCRIPTION: Renders a yellow line between points (260, 75) and (390, 240).
; PLAN: r0=260(x1), r1=75(y1), r2=390(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 75
LDI r2, 390
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
