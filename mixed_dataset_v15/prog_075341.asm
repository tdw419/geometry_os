; DESCRIPTION: Composite: Creates a orange circular shape at (188, 158) with radius 44 then Sets a single purple pixel at (219, 32).
; PLAN: r0=188(x), r1=158(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x), r6=32(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 188
LDI r1, 158
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 32
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
