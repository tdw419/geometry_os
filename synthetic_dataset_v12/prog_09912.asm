; DESCRIPTION: Composite: Creates a black circular shape at (327, 91) with radius 63 then Places a blue dot at position (180, 6).
; PLAN: r0=327(x), r1=91(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=180(x), r6=6(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 327
LDI r1, 91
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 180
LDI r6, 6
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
