; DESCRIPTION: Composite: Places a white dot at position (440, 29) then Creates a cyan circular shape at (185, 60) with radius 27.
; PLAN: r0=440(x), r1=29(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=185(x), r6=60(y), r7=27(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 440
LDI r1, 29
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 185
LDI r6, 60
LDI r7, 27
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
