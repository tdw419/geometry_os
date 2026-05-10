; DESCRIPTION: Composite: Renders a yellow disk with center (157, 42) and radius 38 then Renders a black line between points (165, 158) and (486, 167).
; PLAN: r0=157(x), r1=42(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x1), r6=158(y1), r7=486(x2), r8=167(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 157
LDI r1, 42
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 158
LDI r7, 486
LDI r8, 167
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
