; DESCRIPTION: Composite: Renders a red disk with center (327, 182) and radius 57 then Places a white line segment connecting (29, 179) to (484, 67).
; PLAN: r0=327(x), r1=182(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x1), r6=179(y1), r7=484(x2), r8=67(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 327
LDI r1, 182
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 179
LDI r7, 484
LDI r8, 67
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
