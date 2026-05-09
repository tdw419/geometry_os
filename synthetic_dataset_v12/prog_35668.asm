; DESCRIPTION: Draws a purple line from (248, 165) to (148, 109).
; PLAN: r0=248(x1), r1=165(y1), r2=148(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 165
LDI r2, 148
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
