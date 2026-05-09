; DESCRIPTION: Composite: Draws a magenta circle centered at (304, 111) with radius 41 then Renders a yellow line between points (407, 250) and (91, 96).
; PLAN: r0=304(x), r1=111(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=407(x1), r6=250(y1), r7=91(x2), r8=96(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 304
LDI r1, 111
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 407
LDI r6, 250
LDI r7, 91
LDI r8, 96
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
