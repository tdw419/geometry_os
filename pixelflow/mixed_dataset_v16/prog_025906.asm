; DESCRIPTION: Composite: Creates a yellow circular shape at (251, 41) with radius 15 then Renders a red line between points (66, 142) and (254, 80).
; PLAN: r0=251(x), r1=41(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=66(x1), r6=142(y1), r7=254(x2), r8=80(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 41
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 66
LDI r6, 142
LDI r7, 254
LDI r8, 80
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
