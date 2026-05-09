; DESCRIPTION: Composite: Places a white circle of radius 11 at center (50, 84) then Sets a single yellow pixel at (424, 8).
; PLAN: r0=50(x), r1=84(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=424(x), r6=8(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 50
LDI r1, 84
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 424
LDI r6, 8
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
