; DESCRIPTION: Composite: Places a red dot at position (21, 105) then Creates a cyan circular shape at (380, 135) with radius 79.
; PLAN: r0=21(x), r1=105(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=380(x), r6=135(y), r7=79(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 21
LDI r1, 105
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 380
LDI r6, 135
LDI r7, 79
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
