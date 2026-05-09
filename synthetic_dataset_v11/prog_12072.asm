; DESCRIPTION: Draws a yellow line from (112, 188) to (197, 121).
; PLAN: r0=112(x1), r1=188(y1), r2=197(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 188
LDI r2, 197
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
