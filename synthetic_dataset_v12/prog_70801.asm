; DESCRIPTION: Composite: Creates a cyan circular shape at (126, 143) with radius 64 then Sets a single white pixel at (89, 180).
; PLAN: r0=126(x), r1=143(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=89(x), r6=180(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 126
LDI r1, 143
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 89
LDI r6, 180
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
