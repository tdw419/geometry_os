; DESCRIPTION: Composite: Places a magenta dot at position (286, 131) then Renders a purple disk with center (223, 216) and radius 31.
; PLAN: r0=286(x), r1=131(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=216(y), r7=31(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 286
LDI r1, 131
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 216
LDI r7, 31
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
