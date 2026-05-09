; DESCRIPTION: Composite: Places a yellow circle of radius 50 at center (118, 110) then Places a green dot at position (460, 140).
; PLAN: r0=118(x), r1=110(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=460(x), r6=140(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 118
LDI r1, 110
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 460
LDI r6, 140
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
