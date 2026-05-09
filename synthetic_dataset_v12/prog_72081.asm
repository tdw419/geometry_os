; DESCRIPTION: Composite: Creates a magenta circular shape at (96, 109) with radius 76 then Places a red dot at position (407, 137).
; PLAN: r0=96(x), r1=109(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=407(x), r6=137(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 96
LDI r1, 109
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 407
LDI r6, 137
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
