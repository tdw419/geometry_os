; DESCRIPTION: Composite: Sets a single white pixel at (12, 156) then Places a orange circle of radius 21 at center (353, 46).
; PLAN: r0=12(x), r1=156(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=353(x), r6=46(y), r7=21(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 12
LDI r1, 156
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 353
LDI r6, 46
LDI r7, 21
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
