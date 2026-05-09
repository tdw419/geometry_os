; DESCRIPTION: Composite: Renders a white disk with center (382, 127) and radius 36 then Places a orange dot at position (451, 73).
; PLAN: r0=382(x), r1=127(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x), r6=73(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 382
LDI r1, 127
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 73
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
