; DESCRIPTION: Composite: Sets a single white pixel at (18, 172) then Renders a cyan disk with center (348, 133) and radius 61.
; PLAN: r0=18(x), r1=172(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=348(x), r6=133(y), r7=61(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 18
LDI r1, 172
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 348
LDI r6, 133
LDI r7, 61
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
