; DESCRIPTION: Draws a yellow line from (181, 151) to (159, 31).
; PLAN: r0=181(x1), r1=151(y1), r2=159(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 151
LDI r2, 159
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
