; DESCRIPTION: Composite: Places a orange dot at position (312, 20) then Creates a cyan circular shape at (432, 60) with radius 56.
; PLAN: r0=312(x), r1=20(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=432(x), r6=60(y), r7=56(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 312
LDI r1, 20
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 432
LDI r6, 60
LDI r7, 56
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
