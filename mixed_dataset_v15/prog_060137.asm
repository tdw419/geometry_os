; DESCRIPTION: Composite: Places a black dot at position (172, 50) then Renders a orange disk with center (444, 138) and radius 58.
; PLAN: r0=172(x), r1=50(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=444(x), r6=138(y), r7=58(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 172
LDI r1, 50
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 444
LDI r6, 138
LDI r7, 58
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
