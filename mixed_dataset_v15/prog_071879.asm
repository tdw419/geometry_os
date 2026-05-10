; DESCRIPTION: Composite: Places a green circle of radius 40 at center (236, 78) then Places a black dot at position (48, 142).
; PLAN: r0=236(x), r1=78(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=142(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 236
LDI r1, 78
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 142
LDI r7, 0x000000
PSET r5, r6, r7
HALT
