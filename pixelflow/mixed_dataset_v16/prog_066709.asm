; DESCRIPTION: Composite: Renders a white disk with center (192, 146) and radius 75 then Renders a red line between points (12, 71) and (222, 48).
; PLAN: r0=192(x), r1=146(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=12(x1), r6=71(y1), r7=222(x2), r8=48(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 192
LDI r1, 146
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 12
LDI r6, 71
LDI r7, 222
LDI r8, 48
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
