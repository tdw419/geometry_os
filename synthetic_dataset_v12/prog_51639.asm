; DESCRIPTION: Composite: Places a orange dot at position (466, 185) then Renders a black disk with center (222, 165) and radius 55.
; PLAN: r0=466(x), r1=185(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=222(x), r6=165(y), r7=55(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 466
LDI r1, 185
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 222
LDI r6, 165
LDI r7, 55
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
