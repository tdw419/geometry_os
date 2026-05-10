; DESCRIPTION: Composite: Places a yellow dot at position (411, 50) then Creates a purple circular shape at (400, 112) with radius 31.
; PLAN: r0=411(x), r1=50(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=400(x), r6=112(y), r7=31(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 411
LDI r1, 50
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 400
LDI r6, 112
LDI r7, 31
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
