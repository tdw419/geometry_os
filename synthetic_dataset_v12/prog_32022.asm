; DESCRIPTION: Composite: Renders a purple disk with center (310, 168) and radius 33 then Places a orange dot at position (144, 60).
; PLAN: r0=310(x), r1=168(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=144(x), r6=60(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 310
LDI r1, 168
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 144
LDI r6, 60
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
