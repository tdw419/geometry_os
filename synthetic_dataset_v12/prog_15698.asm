; DESCRIPTION: Composite: Creates a green circular shape at (331, 55) with radius 52 then Sets a single purple pixel at (406, 236).
; PLAN: r0=331(x), r1=55(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x), r6=236(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 331
LDI r1, 55
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 236
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
