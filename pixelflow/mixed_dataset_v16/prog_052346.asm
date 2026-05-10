; DESCRIPTION: Composite: Creates a orange circular shape at (138, 144) with radius 21 then Places a purple dot at position (283, 5).
; PLAN: r0=138(x), r1=144(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x), r6=5(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 138
LDI r1, 144
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 5
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
