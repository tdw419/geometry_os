; DESCRIPTION: Composite: Draws a red circle centered at (312, 182) with radius 47 then Draws a cyan line from (375, 232) to (324, 166).
; PLAN: r0=312(x), r1=182(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=375(x1), r6=232(y1), r7=324(x2), r8=166(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 312
LDI r1, 182
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 375
LDI r6, 232
LDI r7, 324
LDI r8, 166
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
