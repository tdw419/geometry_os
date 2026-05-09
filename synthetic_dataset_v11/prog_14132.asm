; DESCRIPTION: Composite: . Then Draws a blue line from (188, 169) to (137, 21). Then Places a yellow dot at position (52, 140).
; PLAN: r0=188(x1), r1=169(y1), r2=137(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=52(x), r1=140(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue line from (188, 169) to (137, 21).
; PLAN: r0=188(x1), r1=169(y1), r2=137(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 169
LDI r2, 137
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (52, 140).
; PLAN: r0=52(x), r1=140(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 140
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
