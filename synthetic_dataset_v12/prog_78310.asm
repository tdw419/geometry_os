; DESCRIPTION: Renders a purple line between points (370, 56) and (367, 222).
; PLAN: r0=370(x1), r1=56(y1), r2=367(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 56
LDI r2, 367
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
