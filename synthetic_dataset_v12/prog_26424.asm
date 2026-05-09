; DESCRIPTION: Composite: Sets a single cyan pixel at (130, 123) then Places a orange circle of radius 50 at center (241, 165).
; PLAN: r0=130(x), r1=123(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=165(y), r7=50(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 130
LDI r1, 123
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 241
LDI r6, 165
LDI r7, 50
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
