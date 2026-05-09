; DESCRIPTION: Composite: Places a magenta circle of radius 72 at center (439, 90) then Places a orange line segment connecting (312, 103) to (132, 137).
; PLAN: r0=439(x), r1=90(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x1), r6=103(y1), r7=132(x2), r8=137(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 439
LDI r1, 90
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 103
LDI r7, 132
LDI r8, 137
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
