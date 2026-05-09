; DESCRIPTION: Composite: Renders a magenta disk with center (305, 105) and radius 76 then Places a orange dot at position (341, 150).
; PLAN: r0=305(x), r1=105(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=341(x), r6=150(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 305
LDI r1, 105
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 341
LDI r6, 150
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
