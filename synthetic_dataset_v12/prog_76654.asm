; DESCRIPTION: Composite: Places a green circle of radius 33 at center (129, 46) then Places a orange dot at position (342, 234).
; PLAN: r0=129(x), r1=46(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=342(x), r6=234(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 129
LDI r1, 46
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 342
LDI r6, 234
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
