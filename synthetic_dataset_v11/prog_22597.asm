; DESCRIPTION: Draws a yellow line from (232, 74) to (12, 8).
; PLAN: r0=232(x1), r1=74(y1), r2=12(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 74
LDI r2, 12
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
