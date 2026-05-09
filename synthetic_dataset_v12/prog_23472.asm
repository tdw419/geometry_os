; DESCRIPTION: Composite: Places a blue circle of radius 39 at center (317, 126) then Sets a single black pixel at (283, 83).
; PLAN: r0=317(x), r1=126(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x), r6=83(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 317
LDI r1, 126
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 83
LDI r7, 0x000000
PSET r5, r6, r7
HALT
