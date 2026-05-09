; DESCRIPTION: Composite: Places a blue dot at position (0, 241) then Creates a magenta circular shape at (174, 74) with radius 69.
; PLAN: r0=0(x), r1=241(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=174(x), r6=74(y), r7=69(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 0
LDI r1, 241
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 174
LDI r6, 74
LDI r7, 69
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
