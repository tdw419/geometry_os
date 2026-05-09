; DESCRIPTION: Draws a yellow line from (119, 204) to (468, 237).
; PLAN: r0=119(x1), r1=204(y1), r2=468(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 204
LDI r2, 468
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
