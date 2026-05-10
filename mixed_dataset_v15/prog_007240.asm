; DESCRIPTION: Composite: Renders a orange disk with center (399, 72) and radius 23 then Places a magenta dot at position (4, 0).
; PLAN: r0=399(x), r1=72(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=4(x), r6=0(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 399
LDI r1, 72
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 4
LDI r6, 0
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
