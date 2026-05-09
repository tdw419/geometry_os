; DESCRIPTION: Composite: Places a black dot at position (413, 35) then Places a white circle of radius 57 at center (244, 144).
; PLAN: r0=413(x), r1=35(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=244(x), r6=144(y), r7=57(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 413
LDI r1, 35
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 244
LDI r6, 144
LDI r7, 57
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
