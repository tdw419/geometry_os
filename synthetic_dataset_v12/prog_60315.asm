; DESCRIPTION: Composite: Places a purple dot at position (156, 242) then Renders a purple disk with center (413, 140) and radius 52.
; PLAN: r0=156(x), r1=242(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=413(x), r6=140(y), r7=52(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 156
LDI r1, 242
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 413
LDI r6, 140
LDI r7, 52
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
