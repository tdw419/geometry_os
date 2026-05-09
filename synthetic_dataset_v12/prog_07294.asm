; DESCRIPTION: Composite: Sets a single red pixel at (92, 86) then Creates a yellow circular shape at (171, 88) with radius 11.
; PLAN: r0=92(x), r1=86(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=171(x), r6=88(y), r7=11(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 92
LDI r1, 86
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 171
LDI r6, 88
LDI r7, 11
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
