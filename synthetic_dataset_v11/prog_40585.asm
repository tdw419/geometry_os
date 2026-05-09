; DESCRIPTION: Renders a yellow line between points (133, 144) and (17, 26).
; PLAN: r0=133(x1), r1=144(y1), r2=17(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 144
LDI r2, 17
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
