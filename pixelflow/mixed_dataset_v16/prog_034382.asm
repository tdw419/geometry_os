; DESCRIPTION: Composite: Renders a cyan disk with center (181, 184) and radius 55 then Places a blue dot at position (457, 141).
; PLAN: r0=181(x), r1=184(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x), r6=141(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 181
LDI r1, 184
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 141
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
