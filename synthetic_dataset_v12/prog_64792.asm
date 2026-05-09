; DESCRIPTION: Renders a purple line between points (369, 2) and (458, 231).
; PLAN: r0=369(x1), r1=2(y1), r2=458(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 2
LDI r2, 458
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
