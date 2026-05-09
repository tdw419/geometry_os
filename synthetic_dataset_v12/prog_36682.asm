; DESCRIPTION: Composite: Creates a purple circular shape at (376, 72) with radius 62 then Renders a red line between points (87, 158) and (385, 28).
; PLAN: r0=376(x), r1=72(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x1), r6=158(y1), r7=385(x2), r8=28(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 376
LDI r1, 72
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 158
LDI r7, 385
LDI r8, 28
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
