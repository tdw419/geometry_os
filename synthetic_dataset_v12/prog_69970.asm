; DESCRIPTION: Composite: Renders a red disk with center (51, 136) and radius 18 then Places a blue dot at position (48, 93).
; PLAN: r0=51(x), r1=136(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=93(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 51
LDI r1, 136
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 93
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
