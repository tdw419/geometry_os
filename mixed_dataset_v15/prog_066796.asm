; DESCRIPTION: Composite: Places a blue circle of radius 30 at center (254, 79) then Sets a single yellow pixel at (251, 25).
; PLAN: r0=254(x), r1=79(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x), r6=25(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 254
LDI r1, 79
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 25
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
