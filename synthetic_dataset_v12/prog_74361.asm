; DESCRIPTION: Composite: Places a blue dot at position (462, 137) then Places a white circle of radius 57 at center (163, 156).
; PLAN: r0=462(x), r1=137(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=163(x), r6=156(y), r7=57(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 462
LDI r1, 137
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 163
LDI r6, 156
LDI r7, 57
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
