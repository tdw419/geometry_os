; DESCRIPTION: Draws a yellow line from (2, 86) to (247, 159).
; PLAN: r0=2(x1), r1=86(y1), r2=247(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 86
LDI r2, 247
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
