; DESCRIPTION: Draws a yellow line from (197, 104) to (287, 75).
; PLAN: r0=197(x1), r1=104(y1), r2=287(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 104
LDI r2, 287
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
