; DESCRIPTION: Composite: Sets a single red pixel at (314, 247) then Creates a yellow rectangular region at (17, 130) spanning 14 by 62 pixels.
; PLAN: r0=314(x), r1=247(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=17(x), r6=130(y), r7=14(width), r8=62(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 314
LDI r1, 247
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 17
LDI r6, 130
LDI r7, 14
LDI r8, 62
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
