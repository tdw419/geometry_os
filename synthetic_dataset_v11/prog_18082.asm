; DESCRIPTION: Draws a yellow line from (186, 72) to (232, 92).
; PLAN: r0=186(x1), r1=72(y1), r2=232(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 72
LDI r2, 232
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
