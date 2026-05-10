; DESCRIPTION: Draws a yellow line from (159, 127) to (38, 0).
; PLAN: r0=159(x1), r1=127(y1), r2=38(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 127
LDI r2, 38
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
