; DESCRIPTION: Draws a yellow line from (151, 227) to (383, 2).
; PLAN: r0=151(x1), r1=227(y1), r2=383(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 227
LDI r2, 383
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
