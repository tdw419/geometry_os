; DESCRIPTION: Renders a purple line between points (501, 6) and (340, 221).
; PLAN: r0=501(x1), r1=6(y1), r2=340(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 6
LDI r2, 340
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
