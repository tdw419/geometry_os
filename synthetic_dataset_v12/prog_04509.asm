; DESCRIPTION: Composite: Places a orange circle of radius 34 at center (61, 94) then Places a red line segment connecting (89, 15) to (146, 233).
; PLAN: r0=61(x), r1=94(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=89(x1), r6=15(y1), r7=146(x2), r8=233(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 94
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 89
LDI r6, 15
LDI r7, 146
LDI r8, 233
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
