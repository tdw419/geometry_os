; DESCRIPTION: Composite: Renders a purple disk with center (105, 67) and radius 17 then Places a yellow dot at position (240, 147).
; PLAN: r0=105(x), r1=67(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=240(x), r6=147(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 105
LDI r1, 67
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 240
LDI r6, 147
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
