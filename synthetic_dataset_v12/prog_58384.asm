; DESCRIPTION: Composite: Places a green circle of radius 26 at center (461, 30) then Sets a single white pixel at (192, 209).
; PLAN: r0=461(x), r1=30(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x), r6=209(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 461
LDI r1, 30
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 209
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
