; DESCRIPTION: Composite: Renders a magenta disk with center (337, 118) and radius 78 then Places a purple dot at position (445, 204).
; PLAN: r0=337(x), r1=118(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=445(x), r6=204(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 337
LDI r1, 118
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 445
LDI r6, 204
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
