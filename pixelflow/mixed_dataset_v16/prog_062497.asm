; DESCRIPTION: Composite: Places a orange dot at position (75, 97) then Renders a white disk with center (244, 186) and radius 51.
; PLAN: r0=75(x), r1=97(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=244(x), r6=186(y), r7=51(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 75
LDI r1, 97
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 244
LDI r6, 186
LDI r7, 51
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
