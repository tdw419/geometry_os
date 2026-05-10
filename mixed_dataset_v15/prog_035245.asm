; DESCRIPTION: Composite: Places a orange dot at position (306, 171) then Creates a magenta circular shape at (384, 163) with radius 79.
; PLAN: r0=306(x), r1=171(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=384(x), r6=163(y), r7=79(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 306
LDI r1, 171
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 384
LDI r6, 163
LDI r7, 79
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
