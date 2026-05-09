; DESCRIPTION: Composite: Places a white dot at position (213, 251) then Renders a magenta disk with center (471, 104) and radius 37.
; PLAN: r0=213(x), r1=251(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=471(x), r6=104(y), r7=37(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 213
LDI r1, 251
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 471
LDI r6, 104
LDI r7, 37
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
