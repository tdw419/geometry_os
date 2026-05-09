; DESCRIPTION: Draws a yellow line from (314, 136) to (511, 225).
; PLAN: r0=314(x1), r1=136(y1), r2=511(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 136
LDI r2, 511
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
