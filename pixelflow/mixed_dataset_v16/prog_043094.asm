; DESCRIPTION: Draws a yellow line from (131, 241) to (266, 49).
; PLAN: r0=131(x1), r1=241(y1), r2=266(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 241
LDI r2, 266
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
