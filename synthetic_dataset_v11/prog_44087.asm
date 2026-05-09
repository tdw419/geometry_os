; DESCRIPTION: Draws a yellow line from (119, 2) to (123, 245).
; PLAN: r0=119(x1), r1=2(y1), r2=123(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 2
LDI r2, 123
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
