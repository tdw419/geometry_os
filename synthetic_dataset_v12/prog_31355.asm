; DESCRIPTION: Composite: Places a magenta dot at position (312, 134) then Creates a magenta circular shape at (187, 212) with radius 26.
; PLAN: r0=312(x), r1=134(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=187(x), r6=212(y), r7=26(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 312
LDI r1, 134
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 187
LDI r6, 212
LDI r7, 26
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
