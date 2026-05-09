; DESCRIPTION: Renders a purple line between points (508, 46) and (315, 21).
; PLAN: r0=508(x1), r1=46(y1), r2=315(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 46
LDI r2, 315
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
