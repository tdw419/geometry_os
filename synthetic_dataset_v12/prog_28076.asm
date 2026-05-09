; DESCRIPTION: Composite: Places a black dot at position (129, 16) then Creates a cyan circular shape at (57, 88) with radius 39.
; PLAN: r0=129(x), r1=16(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=57(x), r6=88(y), r7=39(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 129
LDI r1, 16
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 57
LDI r6, 88
LDI r7, 39
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
