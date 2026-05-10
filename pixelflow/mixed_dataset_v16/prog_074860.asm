; DESCRIPTION: Composite: Renders a black disk with center (255, 139) and radius 78 then Places a white dot at position (138, 85).
; PLAN: r0=255(x), r1=139(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=138(x), r6=85(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 255
LDI r1, 139
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 138
LDI r6, 85
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
