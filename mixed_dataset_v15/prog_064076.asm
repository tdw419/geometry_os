; DESCRIPTION: Composite: Draws a purple circle centered at (298, 191) with radius 62 then Places a green dot at position (350, 120).
; PLAN: r0=298(x), r1=191(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x), r6=120(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 298
LDI r1, 191
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 120
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
