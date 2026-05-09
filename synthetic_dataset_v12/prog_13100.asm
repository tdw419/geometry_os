; DESCRIPTION: Composite: Places a yellow dot at position (250, 142) then Renders a orange disk with center (397, 155) and radius 23.
; PLAN: r0=250(x), r1=142(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=397(x), r6=155(y), r7=23(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 250
LDI r1, 142
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 397
LDI r6, 155
LDI r7, 23
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
