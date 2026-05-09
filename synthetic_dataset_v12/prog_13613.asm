; DESCRIPTION: Composite: Renders a white disk with center (354, 92) and radius 54 then Places a green dot at position (249, 30).
; PLAN: r0=354(x), r1=92(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x), r6=30(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 354
LDI r1, 92
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 30
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
