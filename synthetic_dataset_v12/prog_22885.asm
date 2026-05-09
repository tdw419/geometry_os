; DESCRIPTION: Draws a yellow line from (325, 95) to (118, 198).
; PLAN: r0=325(x1), r1=95(y1), r2=118(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 95
LDI r2, 118
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
