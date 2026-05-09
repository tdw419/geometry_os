; DESCRIPTION: Composite: Sets a single yellow pixel at (199, 219) then Creates a magenta circular shape at (428, 80) with radius 13.
; PLAN: r0=199(x), r1=219(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=428(x), r6=80(y), r7=13(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 199
LDI r1, 219
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 428
LDI r6, 80
LDI r7, 13
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
