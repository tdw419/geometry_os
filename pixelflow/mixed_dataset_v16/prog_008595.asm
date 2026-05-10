; DESCRIPTION: Composite: Renders a yellow disk with center (319, 86) and radius 55 then Places a green dot at position (489, 28).
; PLAN: r0=319(x), r1=86(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=489(x), r6=28(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 319
LDI r1, 86
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 489
LDI r6, 28
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
