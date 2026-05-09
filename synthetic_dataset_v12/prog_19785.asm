; DESCRIPTION: Renders a purple line between points (350, 204) and (281, 78).
; PLAN: r0=350(x1), r1=204(y1), r2=281(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 204
LDI r2, 281
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
