; DESCRIPTION: Draws a purple line from (156, 129) to (58, 119).
; PLAN: r0=156(x1), r1=129(y1), r2=58(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 129
LDI r2, 58
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
