; DESCRIPTION: Composite: Places a orange dot at position (299, 52) then Renders a magenta disk with center (440, 158) and radius 11.
; PLAN: r0=299(x), r1=52(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=440(x), r6=158(y), r7=11(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 299
LDI r1, 52
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 440
LDI r6, 158
LDI r7, 11
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
