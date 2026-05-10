; DESCRIPTION: Draws a yellow line from (508, 53) to (227, 22).
; PLAN: r0=508(x1), r1=53(y1), r2=227(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 53
LDI r2, 227
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
