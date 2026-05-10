; DESCRIPTION: Composite: Places a white dot at position (182, 128) then Creates a cyan circular shape at (170, 81) with radius 70.
; PLAN: r0=182(x), r1=128(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=170(x), r6=81(y), r7=70(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 182
LDI r1, 128
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 170
LDI r6, 81
LDI r7, 70
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
