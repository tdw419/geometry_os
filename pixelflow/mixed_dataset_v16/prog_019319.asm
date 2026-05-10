; DESCRIPTION: Composite: Creates a green circular shape at (269, 199) with radius 36 then Places a magenta dot at position (244, 187).
; PLAN: r0=269(x), r1=199(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=244(x), r6=187(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 269
LDI r1, 199
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 244
LDI r6, 187
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
