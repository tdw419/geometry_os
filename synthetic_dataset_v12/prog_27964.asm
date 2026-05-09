; DESCRIPTION: Draws a blue line from (142, 50) to (457, 245).
; PLAN: r0=142(x1), r1=50(y1), r2=457(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 50
LDI r2, 457
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
