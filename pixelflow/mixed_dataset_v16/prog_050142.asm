; DESCRIPTION: Composite: Draws a magenta circle centered at (232, 150) with radius 65 then Draws a orange line from (147, 0) to (436, 212).
; PLAN: r0=232(x), r1=150(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=147(x1), r6=0(y1), r7=436(x2), r8=212(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 232
LDI r1, 150
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 147
LDI r6, 0
LDI r7, 436
LDI r8, 212
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
