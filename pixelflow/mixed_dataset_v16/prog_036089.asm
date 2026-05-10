; DESCRIPTION: Composite: Creates a yellow circular shape at (259, 158) with radius 62 then Draws a red line from (381, 57) to (131, 39).
; PLAN: r0=259(x), r1=158(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=381(x1), r6=57(y1), r7=131(x2), r8=39(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 259
LDI r1, 158
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 381
LDI r6, 57
LDI r7, 131
LDI r8, 39
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
