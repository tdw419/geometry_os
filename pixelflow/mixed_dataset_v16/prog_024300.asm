; DESCRIPTION: Composite: Creates a purple circular shape at (56, 232) with radius 16 then Renders a yellow line between points (166, 11) and (278, 20).
; PLAN: r0=56(x), r1=232(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x1), r6=11(y1), r7=278(x2), r8=20(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 56
LDI r1, 232
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 11
LDI r7, 278
LDI r8, 20
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
