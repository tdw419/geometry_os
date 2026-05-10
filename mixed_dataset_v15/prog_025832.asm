; DESCRIPTION: Composite: Places a magenta dot at position (123, 87) then Creates a magenta circular shape at (364, 91) with radius 20.
; PLAN: r0=123(x), r1=87(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=364(x), r6=91(y), r7=20(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 123
LDI r1, 87
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 364
LDI r6, 91
LDI r7, 20
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
