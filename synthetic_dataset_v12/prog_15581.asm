; DESCRIPTION: Composite: Places a purple dot at position (345, 2) then Renders a green disk with center (461, 40) and radius 21.
; PLAN: r0=345(x), r1=2(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=461(x), r6=40(y), r7=21(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 345
LDI r1, 2
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 461
LDI r6, 40
LDI r7, 21
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
