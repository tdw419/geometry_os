; DESCRIPTION: Renders a yellow line between points (81, 222) and (195, 80).
; PLAN: r0=81(x1), r1=222(y1), r2=195(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 222
LDI r2, 195
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
