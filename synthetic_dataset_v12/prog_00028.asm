; DESCRIPTION: Composite: Places a blue circle of radius 63 at center (426, 85) then Places a purple dot at position (32, 138).
; PLAN: r0=426(x), r1=85(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=32(x), r6=138(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 426
LDI r1, 85
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 32
LDI r6, 138
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
