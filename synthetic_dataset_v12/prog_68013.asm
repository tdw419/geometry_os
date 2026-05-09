; DESCRIPTION: Composite: Sets a single cyan pixel at (21, 34) then Creates a white circular shape at (16, 25) with radius 16.
; PLAN: r0=21(x), r1=34(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=16(x), r6=25(y), r7=16(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 21
LDI r1, 34
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 16
LDI r6, 25
LDI r7, 16
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
