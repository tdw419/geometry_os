; DESCRIPTION: Composite: Creates a yellow circular shape at (267, 143) with radius 22 then Places a orange dot at position (162, 167).
; PLAN: r0=267(x), r1=143(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x), r6=167(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 267
LDI r1, 143
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 167
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
