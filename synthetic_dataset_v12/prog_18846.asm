; DESCRIPTION: Composite: Places a yellow dot at position (187, 122) then Creates a yellow circular shape at (411, 114) with radius 72.
; PLAN: r0=187(x), r1=122(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=411(x), r6=114(y), r7=72(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 187
LDI r1, 122
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 411
LDI r6, 114
LDI r7, 72
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
