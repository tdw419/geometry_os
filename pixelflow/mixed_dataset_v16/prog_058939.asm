; DESCRIPTION: Composite: Renders a yellow disk with center (19, 227) and radius 15 then Places a orange dot at position (314, 242).
; PLAN: r0=19(x), r1=227(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x), r6=242(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 19
LDI r1, 227
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 242
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
