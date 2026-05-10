; DESCRIPTION: Composite: Draws a cyan circle centered at (78, 179) with radius 20 then Places a green dot at position (492, 61).
; PLAN: r0=78(x), r1=179(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=492(x), r6=61(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 78
LDI r1, 179
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 492
LDI r6, 61
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
