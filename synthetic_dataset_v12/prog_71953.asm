; DESCRIPTION: Composite: Places a yellow circle of radius 24 at center (159, 33) then Places a green dot at position (86, 207).
; PLAN: r0=159(x), r1=33(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=86(x), r6=207(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 159
LDI r1, 33
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 86
LDI r6, 207
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
