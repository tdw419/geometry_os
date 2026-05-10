; DESCRIPTION: Composite: Places a orange dot at position (76, 190) then Places a cyan line segment connecting (470, 17) to (437, 92) then Draws a red circle centered at (274, 183) with radius 14.
; PLAN: r0=76(x), r1=190(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=470(x1), r6=17(y1), r7=437(x2), r8=92(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=274(x), r11=183(y), r12=14(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 76
LDI r1, 190
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 470
LDI r6, 17
LDI r7, 437
LDI r8, 92
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 183
LDI r12, 14
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
