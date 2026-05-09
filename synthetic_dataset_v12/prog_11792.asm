; DESCRIPTION: Draws a yellow line from (238, 214) to (78, 211).
; PLAN: r0=238(x1), r1=214(y1), r2=78(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 214
LDI r2, 78
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
