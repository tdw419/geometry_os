; DESCRIPTION: Composite: Creates a green circular shape at (334, 117) with radius 28 then Places a green dot at position (94, 197).
; PLAN: r0=334(x), r1=117(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=94(x), r6=197(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 334
LDI r1, 117
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 94
LDI r6, 197
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
