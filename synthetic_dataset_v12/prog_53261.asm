; DESCRIPTION: Composite: Places a black dot at position (154, 188) then Renders a white disk with center (84, 143) and radius 71.
; PLAN: r0=154(x), r1=188(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=84(x), r6=143(y), r7=71(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 154
LDI r1, 188
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 84
LDI r6, 143
LDI r7, 71
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
