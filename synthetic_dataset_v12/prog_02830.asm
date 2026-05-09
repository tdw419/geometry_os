; DESCRIPTION: Composite: Draws a yellow line from (129, 100) to (180, 40) then Creates a yellow circular shape at (247, 41) with radius 13.
; PLAN: r0=129(x1), r1=100(y1), r2=180(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=41(y), r7=13(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 129
LDI r1, 100
LDI r2, 180
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 41
LDI r7, 13
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
