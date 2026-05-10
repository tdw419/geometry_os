; DESCRIPTION: Composite: Sets a single yellow pixel at (340, 16) then Creates a yellow circular shape at (215, 72) with radius 50.
; PLAN: r0=340(x), r1=16(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=215(x), r6=72(y), r7=50(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 340
LDI r1, 16
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 215
LDI r6, 72
LDI r7, 50
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
