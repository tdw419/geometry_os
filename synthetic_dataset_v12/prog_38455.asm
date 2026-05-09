; DESCRIPTION: Composite: Renders a cyan disk with center (176, 198) and radius 31 then Places a blue dot at position (421, 170).
; PLAN: r0=176(x), r1=198(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=421(x), r6=170(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 176
LDI r1, 198
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 421
LDI r6, 170
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
