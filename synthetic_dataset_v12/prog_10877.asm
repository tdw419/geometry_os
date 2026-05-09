; DESCRIPTION: Composite: Places a magenta dot at position (445, 158) then Creates a yellow circular shape at (358, 142) with radius 57.
; PLAN: r0=445(x), r1=158(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=358(x), r6=142(y), r7=57(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 445
LDI r1, 158
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 358
LDI r6, 142
LDI r7, 57
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
