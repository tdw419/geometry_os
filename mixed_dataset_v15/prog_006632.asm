; DESCRIPTION: Composite: Creates a orange circular shape at (88, 177) with radius 57 then Places a green dot at position (223, 143).
; PLAN: r0=88(x), r1=177(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=223(x), r6=143(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 88
LDI r1, 177
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 223
LDI r6, 143
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
