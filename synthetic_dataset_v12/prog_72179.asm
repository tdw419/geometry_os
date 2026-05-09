; DESCRIPTION: Composite: Places a yellow dot at position (287, 18) then Creates a yellow circular shape at (199, 219) with radius 12.
; PLAN: r0=287(x), r1=18(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=199(x), r6=219(y), r7=12(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 287
LDI r1, 18
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 199
LDI r6, 219
LDI r7, 12
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
