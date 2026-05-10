; DESCRIPTION: Composite: Draws a orange line from (109, 10) to (232, 131) then Renders a green disk with center (97, 98) and radius 58.
; PLAN: r0=109(x1), r1=10(y1), r2=232(x2), r3=131(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=97(x), r6=98(y), r7=58(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 109
LDI r1, 10
LDI r2, 232
LDI r3, 131
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 98
LDI r7, 58
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
