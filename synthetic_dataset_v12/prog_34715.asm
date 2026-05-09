; DESCRIPTION: Composite: Creates a orange circular shape at (95, 119) with radius 61 then Places a orange dot at position (220, 224).
; PLAN: r0=95(x), r1=119(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=220(x), r6=224(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 95
LDI r1, 119
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 220
LDI r6, 224
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
