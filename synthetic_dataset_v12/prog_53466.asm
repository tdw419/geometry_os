; DESCRIPTION: Composite: Places a yellow dot at position (105, 42) then Creates a blue circular shape at (316, 155) with radius 68.
; PLAN: r0=105(x), r1=42(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=316(x), r6=155(y), r7=68(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 105
LDI r1, 42
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 316
LDI r6, 155
LDI r7, 68
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
