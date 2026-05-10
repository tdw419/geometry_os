; DESCRIPTION: Composite: Creates a white circular shape at (333, 96) with radius 23 then Sets a single green pixel at (429, 113).
; PLAN: r0=333(x), r1=96(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=429(x), r6=113(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 333
LDI r1, 96
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 429
LDI r6, 113
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
