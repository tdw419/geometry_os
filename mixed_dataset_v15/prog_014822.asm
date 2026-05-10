; DESCRIPTION: Composite: Places a white dot at position (68, 26) then Creates a green circular shape at (43, 166) with radius 11.
; PLAN: r0=68(x), r1=26(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=43(x), r6=166(y), r7=11(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 68
LDI r1, 26
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 43
LDI r6, 166
LDI r7, 11
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
