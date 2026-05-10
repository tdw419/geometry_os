; DESCRIPTION: Draws a yellow line from (314, 8) to (71, 58).
; PLAN: r0=314(x1), r1=8(y1), r2=71(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 8
LDI r2, 71
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
