; DESCRIPTION: Draws a purple line from (149, 83) to (58, 186).
; PLAN: r0=149(x1), r1=83(y1), r2=58(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 83
LDI r2, 58
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
