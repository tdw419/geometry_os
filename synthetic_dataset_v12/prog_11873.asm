; DESCRIPTION: Composite: Places a white dot at position (195, 224) then Renders a orange disk with center (302, 78) and radius 57.
; PLAN: r0=195(x), r1=224(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=302(x), r6=78(y), r7=57(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 195
LDI r1, 224
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 302
LDI r6, 78
LDI r7, 57
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
