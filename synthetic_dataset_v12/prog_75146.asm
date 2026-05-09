; DESCRIPTION: Composite: Renders a magenta disk with center (301, 169) and radius 30 then Places a blue dot at position (458, 131).
; PLAN: r0=301(x), r1=169(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=458(x), r6=131(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 301
LDI r1, 169
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 458
LDI r6, 131
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
