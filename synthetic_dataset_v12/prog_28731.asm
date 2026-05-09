; DESCRIPTION: Draws a yellow line from (261, 182) to (93, 130).
; PLAN: r0=261(x1), r1=182(y1), r2=93(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 182
LDI r2, 93
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
