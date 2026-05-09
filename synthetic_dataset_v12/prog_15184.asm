; DESCRIPTION: Draws a red line from (457, 62) to (53, 130).
; PLAN: r0=457(x1), r1=62(y1), r2=53(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 62
LDI r2, 53
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
