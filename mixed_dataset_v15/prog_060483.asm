; DESCRIPTION: Composite: Renders a magenta disk with center (40, 81) and radius 23 then Places a magenta dot at position (285, 71).
; PLAN: r0=40(x), r1=81(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=285(x), r6=71(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 40
LDI r1, 81
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 285
LDI r6, 71
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
