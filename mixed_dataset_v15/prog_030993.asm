; DESCRIPTION: Composite: Renders a white disk with center (391, 163) and radius 30 then Renders a red line between points (180, 101) and (6, 10).
; PLAN: r0=391(x), r1=163(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=180(x1), r6=101(y1), r7=6(x2), r8=10(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 391
LDI r1, 163
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 180
LDI r6, 101
LDI r7, 6
LDI r8, 10
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
