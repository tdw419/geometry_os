; DESCRIPTION: Composite: Renders a red line between points (314, 8) and (360, 233) then Creates a red circular shape at (15, 50) with radius 10.
; PLAN: r0=314(x1), r1=8(y1), r2=360(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=15(x), r6=50(y), r7=10(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 314
LDI r1, 8
LDI r2, 360
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 50
LDI r7, 10
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
