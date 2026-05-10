; DESCRIPTION: Composite: Places a red dot at position (330, 86) then Creates a red circular shape at (406, 179) with radius 21.
; PLAN: r0=330(x), r1=86(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=406(x), r6=179(y), r7=21(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 330
LDI r1, 86
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 406
LDI r6, 179
LDI r7, 21
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
