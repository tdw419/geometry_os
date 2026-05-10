; DESCRIPTION: Composite: Places a cyan dot at position (176, 213) then Creates a orange circular shape at (450, 31) with radius 24.
; PLAN: r0=176(x), r1=213(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=450(x), r6=31(y), r7=24(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 176
LDI r1, 213
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 450
LDI r6, 31
LDI r7, 24
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
