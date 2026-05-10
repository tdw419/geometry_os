; DESCRIPTION: Composite: Renders a orange disk with center (432, 174) and radius 75 then Places a purple dot at position (261, 16).
; PLAN: r0=432(x), r1=174(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x), r6=16(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 432
LDI r1, 174
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 16
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
