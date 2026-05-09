; DESCRIPTION: Composite: Places a green dot at position (321, 192) then Places a purple circle of radius 25 at center (372, 158).
; PLAN: r0=321(x), r1=192(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=372(x), r6=158(y), r7=25(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 321
LDI r1, 192
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 372
LDI r6, 158
LDI r7, 25
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
