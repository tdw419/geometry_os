; DESCRIPTION: Composite: Sets a single red pixel at (206, 165) then Creates a green circular shape at (410, 140) with radius 23.
; PLAN: r0=206(x), r1=165(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=410(x), r6=140(y), r7=23(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 206
LDI r1, 165
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 410
LDI r6, 140
LDI r7, 23
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
