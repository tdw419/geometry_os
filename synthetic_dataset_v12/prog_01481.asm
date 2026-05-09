; DESCRIPTION: Renders a purple line between points (398, 251) and (88, 168).
; PLAN: r0=398(x1), r1=251(y1), r2=88(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 251
LDI r2, 88
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
