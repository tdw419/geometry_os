; DESCRIPTION: Draws a yellow line from (249, 131) to (381, 157).
; PLAN: r0=249(x1), r1=131(y1), r2=381(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 131
LDI r2, 381
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
