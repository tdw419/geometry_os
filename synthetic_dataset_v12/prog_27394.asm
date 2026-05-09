; DESCRIPTION: Composite: Sets a single yellow pixel at (335, 46) then Creates a yellow circular shape at (290, 90) with radius 59.
; PLAN: r0=335(x), r1=46(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=290(x), r6=90(y), r7=59(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 335
LDI r1, 46
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 290
LDI r6, 90
LDI r7, 59
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
