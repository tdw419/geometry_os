; DESCRIPTION: Composite: Places a magenta circle of radius 25 at center (408, 129) then Draws a orange line from (137, 185) to (454, 209).
; PLAN: r0=408(x), r1=129(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=137(x1), r6=185(y1), r7=454(x2), r8=209(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 408
LDI r1, 129
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 137
LDI r6, 185
LDI r7, 454
LDI r8, 209
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
