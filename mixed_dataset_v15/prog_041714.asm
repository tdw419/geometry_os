; DESCRIPTION: Composite: Renders a green disk with center (105, 94) and radius 73 then Places a yellow dot at position (302, 85).
; PLAN: r0=105(x), r1=94(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=302(x), r6=85(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 105
LDI r1, 94
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 302
LDI r6, 85
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
