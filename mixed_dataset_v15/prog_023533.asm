; DESCRIPTION: Composite: Sets a single white pixel at (143, 18) then Places a orange circle of radius 55 at center (350, 130).
; PLAN: r0=143(x), r1=18(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=350(x), r6=130(y), r7=55(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 143
LDI r1, 18
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 350
LDI r6, 130
LDI r7, 55
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
