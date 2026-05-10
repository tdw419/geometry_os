; DESCRIPTION: Composite: Creates a yellow circular shape at (323, 158) with radius 54 then Places a red line segment connecting (332, 6) to (56, 57).
; PLAN: r0=323(x), r1=158(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x1), r6=6(y1), r7=56(x2), r8=57(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 158
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 6
LDI r7, 56
LDI r8, 57
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
