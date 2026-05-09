; DESCRIPTION: Renders a purple line between points (176, 91) and (160, 115).
; PLAN: r0=176(x1), r1=91(y1), r2=160(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 91
LDI r2, 160
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
