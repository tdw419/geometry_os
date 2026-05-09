; DESCRIPTION: Composite: Sets a single cyan pixel at (92, 91) then Creates a blue circular shape at (369, 96) with radius 72.
; PLAN: r0=92(x), r1=91(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=369(x), r6=96(y), r7=72(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 92
LDI r1, 91
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 369
LDI r6, 96
LDI r7, 72
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
