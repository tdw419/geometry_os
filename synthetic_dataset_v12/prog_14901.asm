; DESCRIPTION: Composite: Sets a single white pixel at (6, 232) then Renders a orange disk with center (65, 129) and radius 64.
; PLAN: r0=6(x), r1=232(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=65(x), r6=129(y), r7=64(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 6
LDI r1, 232
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 65
LDI r6, 129
LDI r7, 64
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
