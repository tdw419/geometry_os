; DESCRIPTION: Draws a yellow line from (221, 132) to (25, 230).
; PLAN: r0=221(x1), r1=132(y1), r2=25(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 132
LDI r2, 25
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
