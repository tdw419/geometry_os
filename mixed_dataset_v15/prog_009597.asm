; DESCRIPTION: Composite: Creates a blue circular shape at (469, 198) with radius 17 then Renders a purple line between points (294, 74) and (419, 184).
; PLAN: r0=469(x), r1=198(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x1), r6=74(y1), r7=419(x2), r8=184(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 469
LDI r1, 198
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 74
LDI r7, 419
LDI r8, 184
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
