; DESCRIPTION: Composite: Creates a black circular shape at (81, 210) with radius 32 then Sets a single yellow pixel at (130, 16).
; PLAN: r0=81(x), r1=210(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=130(x), r6=16(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 81
LDI r1, 210
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 130
LDI r6, 16
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
