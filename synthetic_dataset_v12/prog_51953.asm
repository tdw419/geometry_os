; DESCRIPTION: Composite: Sets a single yellow pixel at (211, 135) then Creates a red circular shape at (57, 157) with radius 30.
; PLAN: r0=211(x), r1=135(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=57(x), r6=157(y), r7=30(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 211
LDI r1, 135
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 57
LDI r6, 157
LDI r7, 30
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
