; DESCRIPTION: Composite: Creates a magenta circular shape at (232, 149) with radius 60 then Sets a single green pixel at (365, 39).
; PLAN: r0=232(x), r1=149(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=365(x), r6=39(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 232
LDI r1, 149
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 365
LDI r6, 39
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
