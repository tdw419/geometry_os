; DESCRIPTION: Draws a yellow line from (81, 185) to (197, 25).
; PLAN: r0=81(x1), r1=185(y1), r2=197(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 185
LDI r2, 197
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
