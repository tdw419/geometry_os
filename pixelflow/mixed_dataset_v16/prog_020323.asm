; DESCRIPTION: Composite: Sets a single orange pixel at (11, 142) then Renders a magenta disk with center (438, 181) and radius 41.
; PLAN: r0=11(x), r1=142(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=438(x), r6=181(y), r7=41(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 11
LDI r1, 142
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 438
LDI r6, 181
LDI r7, 41
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
