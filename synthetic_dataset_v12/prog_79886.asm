; DESCRIPTION: Renders a purple line between points (212, 139) and (424, 222).
; PLAN: r0=212(x1), r1=139(y1), r2=424(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 139
LDI r2, 424
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
