; DESCRIPTION: Composite: Renders a red line between points (131, 237) and (294, 88) then Renders a green disk with center (378, 60) and radius 39.
; PLAN: r0=131(x1), r1=237(y1), r2=294(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=378(x), r6=60(y), r7=39(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 131
LDI r1, 237
LDI r2, 294
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 60
LDI r7, 39
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
