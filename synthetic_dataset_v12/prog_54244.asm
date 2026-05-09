; DESCRIPTION: Composite: Creates a yellow circular shape at (162, 125) with radius 71 then Renders a orange line between points (444, 23) and (3, 208).
; PLAN: r0=162(x), r1=125(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=444(x1), r6=23(y1), r7=3(x2), r8=208(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 162
LDI r1, 125
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 444
LDI r6, 23
LDI r7, 3
LDI r8, 208
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
