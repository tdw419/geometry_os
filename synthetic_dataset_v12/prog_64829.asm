; DESCRIPTION: Composite: Renders a cyan line between points (420, 182) and (427, 148) then Draws a cyan circle centered at (178, 100) with radius 33.
; PLAN: r0=420(x1), r1=182(y1), r2=427(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=178(x), r6=100(y), r7=33(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 420
LDI r1, 182
LDI r2, 427
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 100
LDI r7, 33
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
