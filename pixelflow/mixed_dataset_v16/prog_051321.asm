; DESCRIPTION: Composite: Draws a cyan line from (315, 2) to (414, 130) then Draws a green circle centered at (241, 139) with radius 41.
; PLAN: r0=315(x1), r1=2(y1), r2=414(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=139(y), r7=41(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 315
LDI r1, 2
LDI r2, 414
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 139
LDI r7, 41
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
