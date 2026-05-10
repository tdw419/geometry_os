; DESCRIPTION: Composite: Places a cyan dot at position (202, 42) then Creates a cyan circular shape at (183, 52) with radius 16.
; PLAN: r0=202(x), r1=42(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=52(y), r7=16(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 202
LDI r1, 42
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 183
LDI r6, 52
LDI r7, 16
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
