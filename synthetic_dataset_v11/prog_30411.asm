; DESCRIPTION: Draws a yellow line from (197, 225) to (13, 101).
; PLAN: r0=197(x1), r1=225(y1), r2=13(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 225
LDI r2, 13
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
