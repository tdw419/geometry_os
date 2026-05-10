; DESCRIPTION: Composite: Renders a yellow disk with center (436, 204) and radius 29 then Sets a single yellow pixel at (298, 16).
; PLAN: r0=436(x), r1=204(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x), r6=16(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 436
LDI r1, 204
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 16
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
