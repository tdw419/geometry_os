; DESCRIPTION: Draws a yellow line from (131, 0) to (273, 194).
; PLAN: r0=131(x1), r1=0(y1), r2=273(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 0
LDI r2, 273
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
