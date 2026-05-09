; DESCRIPTION: Composite: Renders a blue disk with center (324, 200) and radius 37 then Places a yellow dot at position (20, 140).
; PLAN: r0=324(x), r1=200(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=140(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 324
LDI r1, 200
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 140
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
