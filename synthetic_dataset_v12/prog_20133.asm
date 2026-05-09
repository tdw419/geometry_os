; DESCRIPTION: Renders a purple line between points (405, 83) and (472, 121).
; PLAN: r0=405(x1), r1=83(y1), r2=472(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 83
LDI r2, 472
LDI r3, 121
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
