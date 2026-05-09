; DESCRIPTION: Composite: Sets a single orange pixel at (249, 39) then Creates a yellow circular shape at (108, 26) with radius 22.
; PLAN: r0=249(x), r1=39(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=108(x), r6=26(y), r7=22(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 249
LDI r1, 39
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 108
LDI r6, 26
LDI r7, 22
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
