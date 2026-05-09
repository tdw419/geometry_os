; DESCRIPTION: Renders a purple line between points (58, 218) and (53, 178).
; PLAN: r0=58(x1), r1=218(y1), r2=53(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 218
LDI r2, 53
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
