; DESCRIPTION: Composite: Renders a cyan line between points (425, 65) and (311, 119) then Creates a purple circular shape at (287, 183) with radius 50.
; PLAN: r0=425(x1), r1=65(y1), r2=311(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=183(y), r7=50(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 425
LDI r1, 65
LDI r2, 311
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 183
LDI r7, 50
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
