; DESCRIPTION: Draws a blue line from (408, 31) to (58, 245).
; PLAN: r0=408(x1), r1=31(y1), r2=58(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 31
LDI r2, 58
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
