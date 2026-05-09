; DESCRIPTION: Composite: Draws a orange line from (468, 129) to (68, 84) then Creates a orange circular shape at (145, 99) with radius 73.
; PLAN: r0=468(x1), r1=129(y1), r2=68(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=99(y), r7=73(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 468
LDI r1, 129
LDI r2, 68
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 99
LDI r7, 73
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
