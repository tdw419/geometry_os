; DESCRIPTION: Composite: Sets a single green pixel at (332, 70) then Renders a purple box of size 11x87 starting at (102, 43) then Creates a red circular shape at (225, 92) with radius 71.
; PLAN: r0=332(x), r1=70(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=102(x), r6=43(y), r7=11(width), r8=87(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=225(x), r11=92(y), r12=71(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 332
LDI r1, 70
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 102
LDI r6, 43
LDI r7, 11
LDI r8, 87
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 92
LDI r12, 71
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
