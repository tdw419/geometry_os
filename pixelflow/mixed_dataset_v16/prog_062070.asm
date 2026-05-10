; DESCRIPTION: Draws a yellow line from (31, 215) to (314, 38).
; PLAN: r0=31(x1), r1=215(y1), r2=314(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 215
LDI r2, 314
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
