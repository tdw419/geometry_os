; DESCRIPTION: Composite: Sets a single cyan pixel at (16, 33) then Creates a black circular shape at (282, 187) with radius 27.
; PLAN: r0=16(x), r1=33(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=282(x), r6=187(y), r7=27(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 16
LDI r1, 33
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 282
LDI r6, 187
LDI r7, 27
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
