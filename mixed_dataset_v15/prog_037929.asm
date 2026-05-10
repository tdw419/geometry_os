; DESCRIPTION: Composite: Places a white dot at position (298, 215) then Creates a orange circular shape at (228, 82) with radius 39.
; PLAN: r0=298(x), r1=215(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=228(x), r6=82(y), r7=39(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 298
LDI r1, 215
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 228
LDI r6, 82
LDI r7, 39
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
