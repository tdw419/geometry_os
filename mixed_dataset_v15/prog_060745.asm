; DESCRIPTION: Composite: Places a white dot at position (396, 74) then Renders a orange disk with center (24, 79) and radius 19.
; PLAN: r0=396(x), r1=74(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=24(x), r6=79(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 396
LDI r1, 74
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 24
LDI r6, 79
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
