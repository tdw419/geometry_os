; DESCRIPTION: Composite: Renders a blue disk with center (259, 178) and radius 43 then Places a blue dot at position (480, 83).
; PLAN: r0=259(x), r1=178(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=480(x), r6=83(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 259
LDI r1, 178
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 480
LDI r6, 83
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
