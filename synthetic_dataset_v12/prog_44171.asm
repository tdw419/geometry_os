; DESCRIPTION: Draws a yellow line from (338, 232) to (36, 96).
; PLAN: r0=338(x1), r1=232(y1), r2=36(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 232
LDI r2, 36
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
