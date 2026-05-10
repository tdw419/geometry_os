; DESCRIPTION: Composite: Places a red dot at position (428, 98) then Creates a magenta circular shape at (339, 75) with radius 59.
; PLAN: r0=428(x), r1=98(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=339(x), r6=75(y), r7=59(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 428
LDI r1, 98
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 339
LDI r6, 75
LDI r7, 59
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
