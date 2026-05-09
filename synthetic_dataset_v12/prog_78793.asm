; DESCRIPTION: Composite: Places a orange dot at position (463, 174) then Creates a yellow circular shape at (79, 204) with radius 32.
; PLAN: r0=463(x), r1=174(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=79(x), r6=204(y), r7=32(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 463
LDI r1, 174
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 79
LDI r6, 204
LDI r7, 32
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
