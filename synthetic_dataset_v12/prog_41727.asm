; DESCRIPTION: Renders a yellow line between points (390, 195) and (359, 19).
; PLAN: r0=390(x1), r1=195(y1), r2=359(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 195
LDI r2, 359
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
