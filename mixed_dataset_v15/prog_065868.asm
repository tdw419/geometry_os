; DESCRIPTION: Composite: Places a red line segment connecting (140, 233) to (96, 105) then Draws a magenta circle centered at (272, 79) with radius 78.
; PLAN: r0=140(x1), r1=233(y1), r2=96(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=79(y), r7=78(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 140
LDI r1, 233
LDI r2, 96
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 79
LDI r7, 78
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
