; DESCRIPTION: Composite: Places a red line segment connecting (389, 202) to (171, 75) then Creates a orange circular shape at (314, 180) with radius 39.
; PLAN: r0=389(x1), r1=202(y1), r2=171(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=180(y), r7=39(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 389
LDI r1, 202
LDI r2, 171
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 180
LDI r7, 39
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
