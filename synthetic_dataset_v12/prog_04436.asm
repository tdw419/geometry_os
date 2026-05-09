; DESCRIPTION: Composite: Places a purple circle of radius 57 at center (75, 172) then Places a red line segment connecting (372, 85) to (89, 162).
; PLAN: r0=75(x), r1=172(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x1), r6=85(y1), r7=89(x2), r8=162(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 75
LDI r1, 172
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 85
LDI r7, 89
LDI r8, 162
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
