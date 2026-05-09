; DESCRIPTION: Renders a purple line between points (40, 32) and (287, 250).
; PLAN: r0=40(x1), r1=32(y1), r2=287(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 32
LDI r2, 287
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
