; DESCRIPTION: Renders a purple line between points (144, 211) and (13, 98).
; PLAN: r0=144(x1), r1=211(y1), r2=13(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 211
LDI r2, 13
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
