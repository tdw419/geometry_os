; DESCRIPTION: Draws a red line from (170, 68) to (341, 130).
; PLAN: r0=170(x1), r1=68(y1), r2=341(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 68
LDI r2, 341
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
