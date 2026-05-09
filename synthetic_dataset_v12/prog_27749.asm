; DESCRIPTION: Composite: Places a yellow circle of radius 67 at center (413, 114) then Sets a single orange pixel at (167, 159).
; PLAN: r0=413(x), r1=114(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=167(x), r6=159(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 413
LDI r1, 114
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 167
LDI r6, 159
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
