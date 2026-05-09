; DESCRIPTION: Composite: Places a purple dot at position (146, 234) then Creates a white circular shape at (382, 163) with radius 24.
; PLAN: r0=146(x), r1=234(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=382(x), r6=163(y), r7=24(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 146
LDI r1, 234
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 382
LDI r6, 163
LDI r7, 24
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
