; DESCRIPTION: Composite: Renders a purple disk with center (230, 99) and radius 16 then Sets a single green pixel at (130, 84).
; PLAN: r0=230(x), r1=99(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=130(x), r6=84(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 230
LDI r1, 99
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 130
LDI r6, 84
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
