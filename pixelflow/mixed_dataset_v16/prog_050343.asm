; DESCRIPTION: Composite: Places a white dot at position (127, 224) then Renders a black disk with center (160, 175) and radius 50.
; PLAN: r0=127(x), r1=224(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=160(x), r6=175(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 127
LDI r1, 224
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 160
LDI r6, 175
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
