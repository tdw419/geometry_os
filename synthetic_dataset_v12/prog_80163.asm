; DESCRIPTION: Composite: Sets a single orange pixel at (254, 11) then Creates a orange circular shape at (284, 140) with radius 38.
; PLAN: r0=254(x), r1=11(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=284(x), r6=140(y), r7=38(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 254
LDI r1, 11
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 284
LDI r6, 140
LDI r7, 38
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
