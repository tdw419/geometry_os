; DESCRIPTION: Composite: Renders a blue line between points (376, 213) and (417, 24) then Places a red circle of radius 20 at center (338, 96).
; PLAN: r0=376(x1), r1=213(y1), r2=417(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=338(x), r6=96(y), r7=20(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 376
LDI r1, 213
LDI r2, 417
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 96
LDI r7, 20
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
