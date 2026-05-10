; DESCRIPTION: Composite: Places a white dot at position (107, 151) then Creates a blue circular shape at (154, 66) with radius 56.
; PLAN: r0=107(x), r1=151(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=154(x), r6=66(y), r7=56(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 107
LDI r1, 151
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 154
LDI r6, 66
LDI r7, 56
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
