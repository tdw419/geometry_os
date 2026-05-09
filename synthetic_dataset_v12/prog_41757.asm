; DESCRIPTION: Composite: Renders a red disk with center (437, 154) and radius 66 then Renders a white line between points (26, 94) and (339, 232).
; PLAN: r0=437(x), r1=154(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x1), r6=94(y1), r7=339(x2), r8=232(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 437
LDI r1, 154
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 94
LDI r7, 339
LDI r8, 232
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
