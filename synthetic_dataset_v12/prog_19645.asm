; DESCRIPTION: Composite: Sets a single orange pixel at (344, 48) then Creates a green circular shape at (168, 86) with radius 27.
; PLAN: r0=344(x), r1=48(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=168(x), r6=86(y), r7=27(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 344
LDI r1, 48
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 168
LDI r6, 86
LDI r7, 27
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
