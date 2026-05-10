; DESCRIPTION: Composite: Places a white circle of radius 53 at center (399, 60) then Sets a single magenta pixel at (320, 45).
; PLAN: r0=399(x), r1=60(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=320(x), r6=45(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 399
LDI r1, 60
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 320
LDI r6, 45
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
