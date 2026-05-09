; DESCRIPTION: Composite: Renders a black line between points (290, 170) and (361, 49) then Renders a red disk with center (379, 175) and radius 37.
; PLAN: r0=290(x1), r1=170(y1), r2=361(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=379(x), r6=175(y), r7=37(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 290
LDI r1, 170
LDI r2, 361
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 175
LDI r7, 37
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
