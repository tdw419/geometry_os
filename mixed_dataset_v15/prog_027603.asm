; DESCRIPTION: Composite: Places a white 78x18 rectangle at position (429, 34) then Sets a single blue pixel at (310, 129).
; PLAN: r0=429(x), r1=34(y), r2=78(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x), r6=129(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 429
LDI r1, 34
LDI r2, 78
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 129
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
