; DESCRIPTION: Composite: Renders a red line between points (384, 182) and (354, 76) then Creates a blue circular shape at (183, 155) with radius 41.
; PLAN: r0=384(x1), r1=182(y1), r2=354(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=183(x), r6=155(y), r7=41(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 384
LDI r1, 182
LDI r2, 354
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 155
LDI r7, 41
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
