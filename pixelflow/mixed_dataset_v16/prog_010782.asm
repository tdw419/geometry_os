; DESCRIPTION: Renders a yellow line between points (200, 240) and (195, 250).
; PLAN: r0=200(x1), r1=240(y1), r2=195(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 240
LDI r2, 195
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
