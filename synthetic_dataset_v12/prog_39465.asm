; DESCRIPTION: Composite: Renders a red disk with center (379, 113) and radius 73 then Places a green line segment connecting (154, 24) to (44, 230).
; PLAN: r0=379(x), r1=113(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=154(x1), r6=24(y1), r7=44(x2), r8=230(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 113
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 154
LDI r6, 24
LDI r7, 44
LDI r8, 230
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
