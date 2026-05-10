; DESCRIPTION: Renders a purple line between points (248, 92) and (156, 223).
; PLAN: r0=248(x1), r1=92(y1), r2=156(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 92
LDI r2, 156
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
