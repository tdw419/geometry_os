; DESCRIPTION: Draws a yellow line from (34, 199) to (55, 36).
; PLAN: r0=34(x1), r1=199(y1), r2=55(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 199
LDI r2, 55
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
