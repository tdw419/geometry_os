; DESCRIPTION: Draws a yellow line from (88, 127) to (336, 194).
; PLAN: r0=88(x1), r1=127(y1), r2=336(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 127
LDI r2, 336
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
