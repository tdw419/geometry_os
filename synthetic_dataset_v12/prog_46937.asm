; DESCRIPTION: Composite: Places a yellow dot at position (183, 149) then Places a white circle of radius 80 at center (98, 93).
; PLAN: r0=183(x), r1=149(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=98(x), r6=93(y), r7=80(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 183
LDI r1, 149
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 98
LDI r6, 93
LDI r7, 80
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
