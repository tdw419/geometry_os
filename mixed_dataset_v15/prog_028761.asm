; DESCRIPTION: Composite: Places a blue dot at position (106, 43) then Places a purple circle of radius 43 at center (212, 46).
; PLAN: r0=106(x), r1=43(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=212(x), r6=46(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 106
LDI r1, 43
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 212
LDI r6, 46
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
